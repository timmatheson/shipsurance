# Simple address object for API requests
module Shipsurance
  class Address
    attr_accessor :address_1, :address_2, :city, :state, :postal_code, :country
  end
end