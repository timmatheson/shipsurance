require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Address do
  it "should accept all valid address attributes" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes.should == valid_address_attributes
  end
  
  it "should mass assign the address_1 attribute" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes[:address_1].should == valid_address_attributes[:address_1]
  end
  
  it "should mass assign the address_2 attribute" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes[:address_2].should == valid_address_attributes[:address_2]
  end
  
  it "should mass assign the city attribute" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes[:city].should == valid_address_attributes[:city]
  end
  
  it "should mass assign the country attribute" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes[:country].should == valid_address_attributes[:country]
  end
  
  it "should mass assign the postal_code attribute" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes[:postal_code].should == valid_address_attributes[:postal_code]
  end
  
  it "should mass assign the country attribute" do
    address = Shipsurance::Address.new(valid_address_attributes)
    address.attributes[:country].should == valid_address_attributes[:country]
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
