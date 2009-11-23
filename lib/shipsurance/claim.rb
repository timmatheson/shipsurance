module Shipsurance
  class Claim < Base
    def add_claim_source_identifier(post = {})
      post[:claim_source_identifier] = ""
    end
    
    def required
      super.push(:person_source_identifier, :person_first_name, :person_last_name, 
       :person_email, :recorded_shipment_id, :ext_carrier, :consignee_full_name, 
       :claim_payment_full_name, :claim_payment_address_1, :claim_payment_city,
       :claim_payment_postal_code, :claim_payment_country, :claim_payment_phone, :file_date, 
       :loss_discovered_date, :ext_claim_type_id,:claim_description,:claim_amount, :certify_correct)
    end
  end
end
  