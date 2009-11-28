require File.dirname(__FILE__) + "/../lib/shipsurance"

def address_attributes
  {
    :address_1    => "123 West street",
    :address_2    => "APT #1",
    :city        => "Rancho Santa Margarita",
    :state       => "CA",
    :postal_code => 92688,
    :country     => "US"
  }
end

CREDENTIALS = YAML.load_file("config/credentials.yml")["test"].symbolize_keys
