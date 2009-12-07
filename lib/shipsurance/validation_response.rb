module Shipsurance
  class ValidationResponse < Response
    
    attr_reader :validation_type, :response_reason, :response
    
    def initialize(response)
      @response        = parse(response)
      @code            = @response[0]
      @reason_code     = @response[1]
      @validation_type = @response[2]
      @response        = @response[4]
      self
    end
    
    def body
      @reason_code
    end
  end
end