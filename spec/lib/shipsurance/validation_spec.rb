require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Validation do
  before :each do
    @validation = Shipsurance::Validation.new
  end
  
  it "should return Accepted given a valid validation type" do
    response = @validation.commit({ :validation_type => "activePolicy" })
    response.body.should == "Accepted"
  end
  
  it "should return an api_response_code of 1 given a valid validation type" do
     response = @validation.commit({ :validation_type => "activePolicy" })
     response.api_response_code.should == 1
   end
  
  it "should return an error given an invalid validation type" do
    response = @validation.commit({ :validation_type => "foo" })
    response.body.should == "The validationType is not valid."
  end
  
  it "should return an api_response_code of 2 given an invalid validation type" do
    response = @validation.commit({ :validation_type => "foo" })
    response.api_response_code.should == 2
  end
end
