require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Person do
  it "should accept all valid person attributes" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes.should == valid_person_attributes
  end
  
  it "should mass assign the first_name attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:first_name].should == valid_person_attributes[:first_name]
  end
  
  it "should mass assign the last_name attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:last_name].should == valid_person_attributes[:last_name]
  end
  
  it "should mass assign the email attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:email].should == valid_person_attributes[:email]
  end
  
  it "should mass assign the source_identifier attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:source_identifier].should == valid_person_attributes[:source_identifier]
  end
  
  it "should mass assign the company attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:company].should == valid_person_attributes[:company]
  end
  
  it "should mass assign the phone attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:phone].should == valid_person_attributes[:phone]
  end
  
  it "should mass assign the fax attribute" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes[:fax].should == valid_person_attributes[:fax]
  end
  
  private
  
  def valid_person_attributes
    {
      :source_indentifier => 1, 
      :company => "Ordercup", 
      :first_name => "Tim", 
      :last_name => "Matheson", 
      :phone => "9495551212", 
      :fax => "9495551212", 
      :email => "tim.matheson@ordercup.com"
    }
  end
end