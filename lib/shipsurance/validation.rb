module Shipsurance
  class Validation < Base
    def required
      super.push(:validation_type)
    end
  end
end