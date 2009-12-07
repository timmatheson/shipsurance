module Shipsurance
  class RecordShipmentResponse < Response
    attr_reader :recorded_shipment_id
    
    def initialize(response)
      @response              = parse(response)
      @code                  = @response[0]
      @reason_code           = @response[1]
      @recorded_shipment_id  = @response[2]
      self
    end
  end
end