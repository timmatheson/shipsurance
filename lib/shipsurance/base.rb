# Module for integrating with the Shipsurance API.
module Shipsurance
  class Base
    require 'net/http'
    require 'cgi'
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
      post[:person_source_indentifier] = person.source_identifier
      post[:person_company]            = person.company
      post[:person_first_name]         = person.first_name
      post[:person_last_name]          = person.last_name
      post[:person_phone]              = person.phone
      post[:person_fax]                = person.fax
      post[:person_email]              = person.email
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
    
    private
   
    def format_date(date, format = "%m/%d/%Y")
      date.is_a?(Time) ? date.strftime(format) : date
    end
    
    def validate_request(post)
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