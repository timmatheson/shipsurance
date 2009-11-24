require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Claim do
  before(:each) do
    @claim = Shipsurance::Claim.new
  end
  
  it "should add the claim_source_identifier" do
    @claim.add_claim_source_identifier(1).has_key?(:claim_source_identifier).should == true
  end
end