module Shipsurance
  class ClaimResponse < Response
    attr_reader :claim_id, :claim_code
    
    def initialize(response)
      @response    = parse(response)
      @code        = @response[0]
      @reason_code = @response[1]
      @claim_id    = @response[2]
      @claim_code  = @response[3]
      self
    end
    
  end
end