module Shipsurance
  class ClaimStatus < Base
        
    def required
      super.push(:ext_claim_id, :person_last_name, :person_email)
    end
  end
end