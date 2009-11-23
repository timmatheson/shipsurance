module Shipsurance
  class RecordShipment < Base
    def required
      super.push(:ext_shipment_type_id, :ext_carrier_id, :carrier_service_name, :declared_value, :shipment_date)
    end
  end
end
