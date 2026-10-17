class AddUniqueIndexesForDriversAndTrips < ActiveRecord::Migration[7.2]
  disable_ddl_transaction!

  def change
    add_index :users, :drivers_license_number,
              unique: true,
              algorithm: :concurrently

    remove_index :trips, :trip_request_id,
                 algorithm: :concurrently

    add_index :trips, :trip_request_id,
              unique: true,
              algorithm: :concurrently
  end
end
