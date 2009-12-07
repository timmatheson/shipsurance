# FIELD                    REQUIRED   VALUE  MAX DESCRIPTION
# extPersonSourceId        Required   Varies by User The Source ID used to access the system
# sourceUsername           Required   Varies by User 50 The Username used to access the system
# sourcePassword           Required   Varies by User 50 The Password used to access the system
# extPolicyId              Required   String 10 Shipsurance Policy Number
# personSourceIdentifier   Optional   String 100 External Person identifier
# personCompany            Optional   String 150 Person Company name
# personFirstName          Optional   String 50 Person First Name
# personLastName           Optional   String 50 Person Last Name
# personPhone              Optional   String 50 Person Phone
# personFax                Optional   String 50 Person Fax
# personEmail              Required   String 50 Person Email
# recordSourceIdentifier   Optional   String 50 External Transaction Identifier
# extShipmentTypeId        Required   1 or 2 1 1 = Parcel 2 = Cargo/Freight
# extCarrierId             Required   See Lookup Codes Carrier ID’s - Appendix 1
# carrierServiceName       Required   String 150 Class of shipping service
# referenceNumber          Optional   String 100 Reference Number
# trackingNumber           Optional   String 100 Tracking Number
# declaredValue            Required   Currency 8 Declared Value of the recorded shipment
# transactionDate          Optional   MM/DD/YYYY Date of Transaction - REMOVED
# shipmentDate             Required   MM/DD/YYYY Date of Shipment
# arrivalDate              Optional   MM/DD/YYYY Date of Shipment Arrival
# extCommodityCategoryId   Optional   See Lookup Codes Commodity Category - Appendix 1
# extCommodityTypeId       Optional   See Lookup Codes Commodity Type - Appendix 1
# extPackageTypeId         Optional   See Lookup Codes Package Type - Appendix 1
# packageCount             Optional   String 100 Number of packages
# containsGlass            Optional   0 or 1 1 0 = No 1 = Yes
# packageDescription       Required   String 4000 Contents of shipment
# departureAddress1        Optional   String 100 Parcel Departure Address
# departureAddress2        Optional   String 100 Parcel Departure Address
# departureCity            Optional   String 50 Parcel Departure Address
# departureState           Optional   String 2 Parcel Departure Address
# departurePostalCode      Optional   String 100 Parcel Departure Address
# departureCountry         Optional   String 100 Parcel Departure Address
# consigneeFirstName       Optional   String 50 Recipient First Name- REMOVED
# consigneeLastName        Optional   String 50 Recipient Last Name- REMOVED
# consigneeFullName        Optional   String 150 Recipient Full Name
# destinationAddress1      Optional   String 100 Parcel Destination Address
# destinationAddress2      Optional   String 100 Parcel Destination Address
# destinationCity          Optional   String 50 Parcel Destination Address
# destinationState         Optional   String 2 Parcel Destination Address
# destinationPostalCode    Optional   String 100 Parcel Destination Address
# destinationCountry       Optional   String 100 Parcel Destination Address
# insuredCompany           Optional   String 150 Insured’s Company Name
module Shipsurance
  class RecordShipment < Base
    def add_tracking_number(number, post = {})
      post[:tracking_number] = number
      post
    end
    
    def add_reference_number(number, post = {})
      post[:reference_number] = number
      post
    end
    
    def add_carrier(id, service_name, post = {})
      post[:ext_carrier_id] = id
      post[:carrier_name]   = service_name
      post
    end
    
    def add_ext_shipment_type_id(ext_shipment_type_id, post = {})
      post[:ext_shipment_type_id] = ext_shipment_type_id
      post
    end
    
    def add_record_source_identifier(record_source_identifier, post = {})
      post[:record_source_identifier] = record_source_identifier
      post
    end
    
    def add_shipment_date(date, post = {})
      post[:shipment_date] = format_date(date)
      post
    end
    
    def add_arrival_date(date, post = {})
      post[:arrival_date] = format_date(date)
      post
    end
    
    def add_ext_commodity_category_id(category_id, post = {})
      post[:ext_commodity_category_id] = category_id
      post
    end
    
    def add_ext_package_type_id(ext_package_type_id, post = {})
      post[:ext_package_type_id] = ext_package_type_id
      post
    end
    
    def add_package_count(package_count, post = {})
      post[:package_count] = package_count
      post
    end
    
    # optional 0 = No, 1 = Yes
    def add_contains_glass(contains_glass, post = {})
      post[:contains_glass] = contains_glass
      post
    end
    
    def add_package_description(package_description, post = {})
      post[:package_description] = package_description
      post
    end
    
    # Accepts a Shipsurance address object
    # Adds the departure address to the request
    def add_departure_address(address, post = {})
      add_departure_address_1(address.address_1, post)
      add_departure_address_2(address.address_2, post) if address.address_2
      add_departure_city(address.city, post)
      add_departure_state(address.state, post)
      add_departure_postal_code(address.postal_code, post)
      add_departure_country(address.country, post)
    end
    
    def add_departure_address_1(departure_address_1, post = {})
      post[:departure_address_1] = departure_address_1
      post
    end
    
    def add_departure_address_2(departure_address_2, post = {})
      post[:departure_address_2] = departure_address_2
      post
    end
    
    def add_departure_city(departure_city, post = {})
      post[:departure_city] = departure_city
      post
    end
    
    def add_departure_state(departure_state, post = {})
      post[:departure_state] = departure_state
      post
    end
    
    def add_departure_postal_code(departure_postal_code, post = {})
      post[:departure_postal_code] = departure_postal_code
      post
    end
    
    def add_departure_country(departure_country, post = {})
      post[:departure_country] = departure_country
      post
    end
    
    def add_consignee_first_name(consignee_first_name, post = {})
      post[:consignee_first_name] = consignee_first_name
      post
    end

    def add_consignee_last_name(consignee_last_name, post = {})
      post[:consignee_last_name] = consignee_last_name
      post
    end

    def add_consignee_full_name(consignee_full_name ,post = {})
      post[:consignee_full_name] = consignee_full_name
      post
    end
    
    # Accepts a Shipsurance address object
    # Adds the destination address to the request
    def add_destination_address(address, post = {})
      add_destination_address_1(address.address_1, post)
      add_destination_address_2(address.address_2, post) if address.address_2
      add_destination_city(address.city, post)
      add_destination_state(address.state, post)
      add_destination_postal_code(address.postal_code, post)
      add_destination_country(address.country, post)
    end

    def add_destination_address_1(destination_address_1, post = {})
      post[:destination_address_1] = destination_address_1
      post
    end

    def add_destination_address_2(destination_address_2, post = {})
      post[:destination_address_2] = destination_address_2
      post
    end

    def add_destination_city(destination_city, post = {})
      post[:destination_city] = destination_city
      post
    end

    def add_destination_state(destination_state, post = {})
      post[:destination_state] = destination_state
      post
    end

    def add_destination_postal_code(destination_postal_code, post = {})
      post[:destination_postal_code] = destination_postal_code
      post
    end
    
    def add_destination_country(destination_country, post = {})
      post[:destination_country] = destination_country
      post
    end

    def add_insured_company(insured_company, post = {})
      post[:insured_company] = insured_company
      post
    end
        
    def required
      super.push(:ext_shipment_type_id, :ext_carrier_id, :carrier_service_name, :declared_value, :shipment_date, :person_email, :package_description)
    end
  end
end
