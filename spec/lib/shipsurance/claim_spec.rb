require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Claim do
  before(:each) do
    @claim = Shipsurance::Claim.new
    @address = Shipsurance::Address.new(address_attributes)
  end
  
  context " a valid request" do
    it "should return success" do
      post = @claim.add_person(person)
      @claim.add_recorded_shipment_id(1,post)
      @claim.add_ext_carrier_id(1,post)
      @claim.add_consignee_full_name("Tim Matheson", post)
      @claim.add_claim_payment_full_name("Tim Matheson", post)
      @claim.add_claim_payment_address(@address, post)
      @claim.add_claim_payment_phone("9495551212", post)
      @claim.add_file_date(Time.now, post)
      @claim.add_loss_discovered_date(Time.now, post)
      @claim.add_claim_shipment_date(Time.now, post)
      @claim.add_ext_claim_type_id(1, post)
      @claim.add_claim_description("Test #{rand(9999)}", post)
      @claim.add_claim_amount(5.00, post)
      @claim.add_certify_correct(true, post)
      @claim.add_credentials(post)
      response = @claim.commit(post)
      response.body.should == "blah"
    end
  end
  
  context " attributes" do
    it "should add the claim_source_identifier" do
      @claim.add_claim_source_identifier(1).has_key?(:claim_source_identifier).should == true
    end
  end
  
  private
  
  def person
    Shipsurance::Person.new({
      :source_indentifier => 1,
      :company => "OrderCup",
      :first_name => "Tim",
      :last_name => "Matheson",
      :phone => "9495551212",
      :fax => "9495551212",
      :email => "aloke.nath@ordercup.com"
    })
  end
end