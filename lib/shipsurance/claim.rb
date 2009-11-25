# FIELD                  REQUIRED VALUE MAX DESCRIPTION
# extPersonSourceId      Required Varies by User The Source ID used to access the system
# sourceUsername         Required Varies by User 50 The Username used to access the system
# sourcePassword         Required Varies by User 50 The Password used to access the system
# extPolicyId            Required String 10 DSI Policy Number
# personSourceIdentifier Required String 100 External Person identifier
# personCompany          Optional String 150 Person Company name
# personFirstName        Required String 50 Person First Name
# personLastName         Required String 50 Person Last Name
# personPhone            Optional String 50 Person Phone
# personFax              Optional String 50 Person Fax
# personEmail            Required String 50 Person Email
# recordedShipmentId     Required String 36 DSI Recorded Shipment ID
# claimSourceIdentifier  Optional String 50 External Transaction Identifier
# extCarrierId           Required See Lookup Codes Carrier ID’s - Appendix 1
# carrierServiceName     Optional Strinf 150 Carrier Service Name
# consigneeFullName      Required String 100 Full Name of Consignee
# claimPaymentFullName   Required String 15 Name to make the Claim Check Payable To
# claimPaymentAddress1   Required String 100 Claim Payment Address
# claimPaymentAddress2   Optional String 100 Claim Payment Address
# claimPaymentCity       Required String 50 Claim Payment Address
# claimPaymentState      Optional String 2 Claim Payment Address
# claimPaymentPostalCode Required String 100 Claim Payment Address
# claimPaymentCountry    Required String 100 Claim Payment Address
# claimPaymentPhone      Required String 100 Claim Payment Phone
# claimPaymentFax        Optional String 50 Claim Payment Fax
# claimPaymentEmail      Optional String 100 Claim Payment Email
# fileDate               Required MM/DD/YYYY Date claim filed (Now)
# lossDiscoveredDate     Required MM/DD/YYYY Date loss discovered
# extClaimTypeId         Required 1 or 2 1 1 = Loss 2 = Damage
# claimDescription       Required String 4000 Description of claim
# claimAmount            Required Currency 8 Claim Amount (must be less than recorded shipment declared value)
# certifyCorrect         Required 0 or 1 1 0 = No 1 = Yes (Must answer 1 to file)
module Shipsurance
  class Claim < Base
    def add_claim_source_identifier(claim_source_identifier, post = {})
      post[:claim_source_identifier] = claim_source_identifier
      post
    end
    
    def add_ext_carrier_id(id, post = {})
      post[:ext_carrier_id] = id
      post
    end
    
    def add_consignee_full_name(full_name, post = {})
      post[:consignee_full_name] = full_name
      post
    end
    
    def add_claim_payment_full_name(full_name, post = {})
      post[:claim_payment_full_name] = full_name
      post
    end
    
    def add_claim_payment_address(address, post = {})
      add_claim_payment_address_1(address.address_1, post)
      add_claim_payment_city(address.city, post)
      add_claim_payment_postal_code(address.postal_code, post)
      add_claim_payment_country(address.country, post)
      post
    end
    
    def add_claim_payment_address_1(address_1, post = {})
      post[:claim_payment_address_1] = address_1
      post
    end
    
    def add_claim_payment_city(city, post = {})
      post[:claim_payment_city] = city
      post
    end
    
    def add_claim_payment_postal_code(postal_code, post = {})
      post[:claim_payment_postal_code] = postal_code
      post
    end
    
    def add_claim_payment_country(country, post = {})
      post[:claim_payment_country] = country
      post
    end
    
    def add_claim_payment_phone(phone, post = {})
      post[:claim_payment_phone] = phone
      post
    end
    
    def add_file_date(date, post = {})
      post[:file_date] = format_date(date)
      post
    end
    
    def add_loss_discovered_date(date, post = {})
      post[:loss_discovered_date] = format_date(date)
      post
    end
    
    def add_ext_claim_type_id(id, post = {})
      post[:ext_claim_type_id] = id
      post
    end
    
    def add_claim_description(description, post = {})
      post[:claim_description] = description
      post
    end
    
    def add_claim_amount(amount, post = {})
      post[:claim_amount] = amount
      post
    end
    
    def add_certify_correct(bool, post = {})
      post[:certify_correct] = bool ? 1 : 0
    end
    
    def add_claim_shipment_date(date, post = {})
      post[:claim_shipment_date] = format_date(date)
      post
    end
    
    def required
      super.push(:person_source_identifier, :person_first_name, :person_last_name, 
       :person_email, :recorded_shipment_id, :ext_carrier_id, :consignee_full_name, 
       :claim_payment_full_name, :claim_payment_address_1, :claim_payment_city,
       :claim_payment_postal_code, :claim_payment_country, :claim_payment_phone, :file_date, 
       :loss_discovered_date, :ext_claim_type_id,:claim_description,:claim_amount, :certify_correct, :claim_shipment_date)
    end
  end
end
  