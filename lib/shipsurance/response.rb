module Shipsurance
  class Response
    attr_reader :code, :body, :api_response_code, :success, :transaction_key
    
    def initialize(response)
      response_arry = response.body.split(",")
      @code, @api_response_code, @body, @transaction_key = response.code.to_i, response_arry[0].to_i, response_arry[1], response_arry[2]
      @success = (@response_code == 1)
      self
    end 
  end
end