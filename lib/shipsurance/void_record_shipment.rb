module Shipsurance
  class VoidRecordShipment < Base
    def required
      super.push(:person_email,:recorded_shipment_id,:ext_rs_void_reason_id)
    end
  end
end