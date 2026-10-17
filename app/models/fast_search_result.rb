# == Schema Information
#
# Table name: fast_search_results
#
#  avg_rating  :decimal(, )
#  driver_name :text
#  trip_count  :bigint
#  driver_id   :integer
#
# Indexes
#
#  index_fast_search_results_on_driver_id  (driver_id) UNIQUE
#
class FastSearchResult < ApplicationRecord
  # this isn't strictly necessary, but it will prevent
  # rails from calling save, which would fail anyway.
  def readonly?
    true
  end

  def self.refresh(concurrently: false)
    Scenic.database.refresh_materialized_view(
      table_name,
      concurrently: concurrently,
      cascade: false
    )
  end
end
