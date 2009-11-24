# Simple person object for API requests
module Shipsurance
  class Person
    attr_accessor :source_indentifier, :company, :first_name, :last_name, :phone, :fax, :email
  end
end