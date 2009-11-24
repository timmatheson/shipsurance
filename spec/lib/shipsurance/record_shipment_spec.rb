require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::RecordShipment do
  before(:each) do
    @record_shipment = Shipsurance::RecordShipment.new
    @address         = Shipsurance::Address.new(
      :address_1    => "123 West street",
      :address_2    => "APT #1",
      :city        => "Rancho Santa Margarita",
      :state       => "CA",
      :postal_code => 92688,
      :country     => "US"
    )
  end
  
  it "should add the tracking number" do
    @record_shipment.add_tracking_number("1Z999999999999999").has_key?(:tracking_number).should == true
  end
  
  it "should add the reference number" do
    @record_shipment.add_reference_number(123456).has_key?(:reference_number).should == true
  end
  
  it "should add the carrier" do
    params = @record_shipment.add_carrier(1,"UPS")
    params.has_key?(:carrier_name).should == true
    params.has_key?(:ext_carrier_id).should == true
  end
  
  it "should add the ext_shipment_type_id" do
    @record_shipment.add_ext_shipment_type_id(1).has_key?(:ext_shipment_type_id).should == true
  end
  
  it "should add the record_source_identifier" do
    @record_shipment.add_record_source_identifier(123456).has_key?(:record_source_identifier).should == true
  end
  
  it "should add the recorded_shipment_id" do
    @record_shipment.add_recorded_shipment_id(1).has_key?(:recorded_shipment_id).should == true
  end
  
  it "should add the shipment_date" do
    params = @record_shipment.add_shipment_date(Time.now)
    params.has_key?(:shipment_date).should == true
    params[:shipment_date].should == Time.now.strftime("%m/%d/%Y")
  end
  
  it "should add the arrival_date" do
    params = @record_shipment.add_arrival_date(Time.now)
    params.has_key?(:arrival_date).should == true
    params[:arrival_date].should == Time.now.strftime("%m/%d/%Y")
  end
  
  it "should add the ext_commodity_category_id" do
    @record_shipment.add_ext_commodity_category_id(1).has_key?(:ext_commodity_category_id).should == true
  end
  
  it "should add the ext_package_type_id" do
    @record_shipment.add_ext_package_type_id(1).has_key?(:ext_package_type_id).should == true
  end
  
  it "should add the package_count" do
    @record_shipment.add_package_count(1).has_key?(:package_count).should == true
  end
  
  it "should add contains_glass" do
    @record_shipment.add_contains_glass(1).has_key?(:contains_glass).should == true
  end
  
  it "should add the package_description" do
    @record_shipment.add_package_description("Test Description").has_key?(:package_description).should == true
  end
  
  it "should add the departure_address" do
    @record_shipment.should_receive(:add_departure_address_1).once.with(@address.address_1,{})
    @record_shipment.should_receive(:add_departure_address_2).once.with(@address.address_2,{})
    @record_shipment.should_receive(:add_departure_city).once.with(@address.city,{})
    @record_shipment.should_receive(:add_departure_state).once.with(@address.state,{})
    @record_shipment.should_receive(:add_departure_postal_code).once.with(@address.postal_code,{})
    @record_shipment.should_receive(:add_departure_country).once.with(@address.country,{})
    @record_shipment.add_departure_address(@address)
  end
end