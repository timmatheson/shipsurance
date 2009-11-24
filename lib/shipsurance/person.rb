# Simple person object for API requests
module Shipsurance
  class Person
    attr_reader :attributes
    attr_accessor :source_indentifier, :company, :first_name, :last_name, :phone, :fax, :email
    
    def initialize(attributes = {})
      @attributes = attributes
      attributes.map do |name, value|
        instance_variable_set("@#{name.to_s}",value)
      end
    end
  end
end