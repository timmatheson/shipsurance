module Shipsurance
  class VoidRecordShipmentResponse < Response
        
    def initialize(response)
      @response              = parse(response)
      @code                  = @response[0]
      @reason_code           = @response[1]
      self
    end
  end
end