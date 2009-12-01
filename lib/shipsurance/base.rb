# Module for integrating with the Shipsurance API.
module Shipsurance
  class Base
    require 'net/http'
    require 'yaml'
    @@live_base_url = "https://www.dsiins.com/api.net"
    @@test_base_url = "http://dev.dsiins.com/dsiapp/api.net"
    @@errors        = []
    
    # Adds the request credentials to the request.
    # This method should be called for every request that requires
    # authentication to process the request.
    def add_credentials(post = {})
      post[:ext_person_source_id] = credentials[:ext_person_source_id]
      post[:source_username]      = credentials[:username]
      post[:source_password]      = credentials[:password]
      post[:ext_policy_id]        = credentials[:ext_policy_id]
      post
    end
    
    # Adds a person to the request parameters
    # Accepts a Shipsurance::Person object
    def add_person(person, post = {})
      post[:person_source_identifier] = person.source_identifier
      post[:person_company]            = person.company
      post[:person_first_name]         = person.first_name
      post[:person_last_name]          = person.last_name
      post[:person_phone]              = person.phone
      post[:person_fax]                = person.fax
      post[:person_email]              = person.email
      post
    end
    
    # Adds the recorded shipment id to the parameters hash
    def add_recorded_shipment_id(recorded_shipment_id, post = {})
      post[:recorded_shipment_id] = recorded_shipment_id
      post
    end
        
    # Commit the parameters to the API
    # This processes the request, and returns the response
    def commit(post)
      add_credentials(post)
      validate_request(post)
      url = URI.parse(resource_url)
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data(post.to_s)
      res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
      case res
      when Net::HTTPSuccess#, Net::HTTPRedirection
        Shipsurance::Response.new(res)
      else
        raise Shipsurance::RequestError, res.error!
      end
    end
    
    # Used for debugging, alias to puts
    def display(msg)
      puts "=" * 15 + " REQUEST " + "=" * 15 
      puts msg
      puts "=" * 15 + " EOF REQUEST " + "=" * 15
    end
    
    # Returns the correct url for the current resource
    # Appends the correct path to the base_url
    def resource_url
      base_url + "/dsi_" + resource_name + ".aspx"
    end
    
    # Returns the resource name downcased as a string
    def resource_name
      resource_class.slice(0,1).downcase + resource_class.slice(1,resource_class.length)
    end
    
    # Returns the class name of the current class as a string
    def resource_class
      @resource_class ||= self.class.to_s.split(":").last
    end
    
    def base_url
      return RAILS_ENV =~ /production/ ? @@live_base_url : @@test_base_url
    end
    
    # Returns an array of the required parameters for the current class.
    def required
      [:ext_person_source_id, :source_username, :source_password, :ext_policy_id]
    end
    
    CARRIERS = {
      "USPS"                                => 1,
      "FedEx"                               => 2, 
      "UPS"                                 => 3, 
      "DHL"                                 => 4, 
      "Canada Post"                         => 5, 
      "BAX Global"                          => 6, 
      "Purolator"                           => 7, 
      "Greyhound GPX"                       => 8, 
      "Australian Post"                     => 9, 
      "Common Carrier"                      => 10,
      "ICS Courier"                         => 11,
      "Royal Mail"                          => 12,
      "EMS"                                 => 13,
      "TNT Express"                         => 14,
      "French Postal System"                => 15,
      "Lone Star Overnight"                 => 16,
      "Spee-Dee Delivery"                   => 17,
      "Golden State Overnight"              => 18,
      "SAIA"                                => 19,
      "Overnite Transportation"             => 20,
      "CTI"                                 => 21,
      "Roadway"                             => 22,
      "Highway Freight"                     => 23,
      "Yellow Freight"                      => 24,
      "American Freight Companies"          => 25,
      "Oak Harbor"                          => 26,
      "Pitt Ohio"                           => 27,
      "Koch Logistics"                      => 28,
      "Old Dominion"                        => 29,
      "Estes Express"                       => 30,
      "R+L Carriers"                        => 31,
      "Eastern Connection"                  => 32,     
      "Overnite Express Overnite Express"   => 33,
      "California Overnight"                => 34,
      "ABF Freight System"                  => 35,
      "UPS Supply Chain Solutions"          => 36,
      "FedEx Freight"                       => 37,
      "DHL Danzas"                          => 38,
      "Watkins Motor Lines"                 => 39,
      "Nebraska Transport Company"          => 40,
      "UPS Mail Innovations"                => 41,
      "AAA Cooper"                          => 42,
      "Central Freight Lines"               => 43,
      "Dayton Freight Lines"                => 44,
      "Eagle Global Logistics"              => 45,
      "New Penn"                            => 46,
      "Pilot Air Freight"                   => 47,
      "Roadrunner Dawes Freight"            => 48,
      "SEKO Worldwide"                      => 49,
      "Southeastern Freight Lines"          => 50,
      "Target Logistic Services"            => 51,
      "Vitran Express"                      => 52,
      "United Van Lines"                    => 53,
      "Bekins"                              => 54,
      "HomeDirectUSA"                       => 55,
      "IMEX Pitney Bowes IMEX"              => 56,
      "UPS Freight"                         => 57,
      "USF Holland"                         => 58,
      "USF Reddaway"                        => 59,
      "Averitt Express"                     => 60,
      "STI Specialized Transportation Inc." => 61,
      "Parcelforce U.K."                    => 62,
      "Pharos U.K."                         => 63,
      "YRC Replacing Yellow and Roadway"    => 64,
      "DB Schenker"                         => 65
    }
    
    COMMODITY_CATEGORY_IDS = {
      "General Merchandise"                => 1,
      "Machinery"                          => 2, 
      "Household Goods & Personal Effects" => 3,  
      "Fragile Goods/Glass"                => 4,  
      "Computers/Electronics"              => 5,  
      "Fine Arts"                          => 6,  
      "Motorcycles/Automobiles"            => 7,  
      "Precision Instruments"              => 8,  
      "Musical Instruments"                => 9,  
      "Chemicals/Hazardous Materials"      => 10, 
      "Non Perishable Foods"               => 11, 
      "Bottled Beverages"                  => 12, 
      "Frozen/Chilled Foods (Not Meats)"   => 13, 
      "Frozen/Chilled Meats"               => 14, 
      "Steel Products"                     => 15, 
      "Branded Goods"                      => 16, 
      "Ceramic, Marble, Granite Tiles"     => 17, 
      "Watercraft"                         => 18, 
      "Bagged Commodities"                 => 19, 
      "Ceramic, Marble, Granite Tiles"     => 20, 
      "Lumber"                             => 21, 
      "Boats/Yachts"                       => 22 
    }
    
    COMMODITY_TYPE_IDS = {
      "New Goods"           => 1,
      "Used Goods"          => 2,
      "Reconditioned Goods" => 3
    }
    
    PACKAGE_TYPE_IDS = {
     "Box"       => 1,
     "Container" => 2,
     "Crate"     => 3,
     "Pallet"    => 4,
     "Other"     => 5
    }
    
    private
   
    def format_date(date, format = "%m/%d/%Y")
      date.is_a?(Time) ? date.strftime(format) : date
    end
    
    def validate_request(post)
      @@errors.clear
      required.each do |key|
        @@errors << "Missing required parameter #{key.to_s}" unless post.has_key?(key)
      end
      raise Shipsurance::RequestError, @@errors.join(", ") unless @@errors.empty?
    end
    
    def credentials
      @credentials ||= YAML.load_file(File.dirname(__FILE__) + "/../../config/credentials.yml")[RAILS_ENV].symbolize_keys
    end
  end
end