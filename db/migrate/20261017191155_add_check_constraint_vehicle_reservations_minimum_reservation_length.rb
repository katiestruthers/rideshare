class AddCheckConstraintVehicleReservationsMinimumReservationLength < ActiveRecord::Migration[7.2]
  def change
    add_check_constraint :vehicle_reservations,
                         "ends_at >= (starts_at + INTERVAL '30 minutes')",
                         name: 'minimum_reservation_length',
                         validate: false
  end
end
