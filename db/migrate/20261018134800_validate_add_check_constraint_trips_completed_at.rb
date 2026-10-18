class ValidateAddCheckConstraintTripsCompletedAt < ActiveRecord::Migration[7.2]
  def change
    validate_check_constraint :trips, name: 'trips_completed_after_created'
  end
end
