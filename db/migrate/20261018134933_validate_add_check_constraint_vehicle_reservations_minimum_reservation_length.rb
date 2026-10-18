class ValidateAddCheckConstraintVehicleReservationsMinimumReservationLength < ActiveRecord::Migration[7.2]
  def change
    validate_check_constraint :vehicle_reservations, name: 'minimum_reservation_length'
  end
end
