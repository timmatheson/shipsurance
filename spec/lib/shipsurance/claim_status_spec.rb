require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::ClaimStatus do
  before(:each) do
    @claim_status = Shipsurance::ClaimStatus.new
    @claim        = Shipsurance::Claim.new
    @shipment_id = Shipsurance::RecordShipment.new.commit(valid_record_shipment_params).recorded_shipment_id
    @claim_response = @claim.commit({:recorded_shipment_id => @shipment_id}.merge!(add_params(valid_record_shipment_params)))
  end
  
  it "should return success" do
    post = {}
    post[:person_email] = CREDENTIALS[:person_email] 
    post[:ext_claim_id] = @claim_response.claim_code
    post[:claim_id] = @claim_response.claim_id
    response = @claim_status.commit(post)
    response.reason_code.should == "The transaction was accepted."
  end
  
  private
  
  def add_params(post = {})
    post[:person_source_identifier]      = '1' 
    post[:person_first_name]             = 'Tim' 
    post[:person_last_name]              = 'Matheson' 
    post[:ext_carrier_id]                = '2' 
    post[:consignee_full_name]           = 'Tim Matheson' 
    post[:claim_payment_full_name]       = 'Bill Smith' 
    post[:claim_payment_address_1]       = '123 Test Address' 
    post[:claim_payment_city]            = 'RSM' 
    post[:claim_payment_postal_code]     = '92688' 
    post[:claim_payment_country]         = 'US' 
    post[:claim_payment_phone]           = '9492945624' 
    post[:file_date]                     = Time.now.strftime("%m/%d/%Y") 
    post[:loss_discovered_date]          = Time.now.strftime("%m/%d/%Y")
    post[:ext_claim_type_id]             = '1' 
    post[:claim_description]             = 'Test Description' 
    post[:claim_amount]                  = '11.99' 
    post[:certify_correct]               = '1' 
    post[:claim_shipment_date]           = Time.now.strftime("%m/%d/%Y")
    post
  end
  
  
  def valid_record_shipment_params
    {
      :ext_shipment_type_id => 1,
      :ext_carrier_id => 1,
      :carrier_service_name => "UPS",
      :declared_value => 50.00,
      :shipment_date => Time.now.strftime("%m/%d/%Y"),
      :person_email => CREDENTIALS[:person_email],
      :package_description => "Test Description #{rand(9999999)}"
    }
  end
end