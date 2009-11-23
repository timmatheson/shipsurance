module Shipsurance
  class Validation
    def required
      super.push(:validation_type)
    end
  end
end