class AddCheckConstraintTripsCompletedAt < ActiveRecord::Migration[7.2]
  def change
    add_check_constraint :trips,
      "completed_at > created_at",
      name: "trips_completed_after_created"
  end
end
