# Simple address object for API requests
module Shipsurance
  class Address
    attr_reader :attributes
    attr_accessor :address_1, :address_2, :city, :state, :postal_code, :country
    
    def initialize(attributes = {})
      @attributes = attributes
      attributes.map do |name, value|
        instance_variable_set("@#{name.to_s}",value)
      end
    end
  end
end