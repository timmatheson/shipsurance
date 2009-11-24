require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Address do
  it "should accept all valid address attributes" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes.should == valid_address_attributes
  end
  
  private
  
  def valid_address_attributes
    {
      :address_1 => "123 East St.", 
      :address_2 => "APT #3", 
      :city => "Rancho Santa Margarita", 
      :state => "CA", 
      :postal_code => 92688, 
      :country => "US"
    }
  end
end
