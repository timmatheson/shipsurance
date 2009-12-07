module Shipsurance
  class ClaimStatusResponse < Response
    def initialize(response)
      @response                      = response.body.split("|")
      @code                          = @response[0]
      @reason_code                   = @response[1]
      @claim_status_type             = @response[2]
      @claim_status_type_description = @response[3]
      @claim_comments                = @response[4]
      @last_updated                  = @response[5]
      self
    end
  end
end