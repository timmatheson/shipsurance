module Shipsurance
  class Response
    attr_reader :code, :body, :reason_code, :api_response_code
    
    def initialize(response)
      @response_arry = parse(response)
      @code, @api_response_code, @body, @recorded_shipment_id = response.code.to_i, @response_arry[0].to_i, @response_arry[1], @response_arry[2]
      @success = (@api_response_code == 1)
      self
    end 
    
    def code
      @code.to_i == 1 ? 200 : @code
    end
    
    def body
      @reason_code || @body
    end
    
    def success
      @code.to_i == 1
    end
    
    def success?
      @success ||= success
    end
    
    def parse(response)
      response.body.split(",")
    end
  end
end