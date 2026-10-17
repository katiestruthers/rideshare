class AddMissingForeignKeyIndexes < ActiveRecord::Migration[7.2]
  disable_ddl_transaction!

  def change
    add_index :trip_positions, :trip_id,
              algorithm: :concurrently

    add_index :vehicle_reservations, :trip_request_id,
              algorithm: :concurrently
  end
end
