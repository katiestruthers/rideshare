class AddLocationsCityStateUnique < ActiveRecord::Migration[7.2]
  disable_ddl_transaction!

  def change
    add_index :locations, %i[city state],
              unique: true,
              algorithm: :concurrently
  end
end
