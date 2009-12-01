module Shipsurance
  class Response
    attr_reader :code, :body, :api_response_code, :success, :recorded_shipment_id
    
    def initialize(response)
      response_arry = parse(response)
      @code, @api_response_code, @body, @recorded_shipment_id = response.code.to_i, response_arry[0].to_i, response_arry[1], response_arry[2]
      @success = (@api_response_code == 1)
      self
    end 
    
    def parse(response)
      response.body.split(",")
    end
  end
end