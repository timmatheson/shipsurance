require File.dirname(__FILE__) + "/../../spec_helper"

describe Shipsurance::Person do
  it "should accept all valid person attributes" do
    person = Shipsurance::Person.new(valid_person_attributes)
    person.attributes.should == valid_person_attributes
  end
  
  private
  
  def valid_person_attributes
    {
      :source_indentifier => 1, 
      :company => "Ordercup", 
      :first_name => "Tim", 
      :last_name => "Matheson", 
      :phone => "9492945624", 
      :fax => "9492945624", 
      :email => "tim.matheson@ordercup.com"
    }
  end
end