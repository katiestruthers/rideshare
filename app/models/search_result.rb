# == Schema Information
#
# Table name: search_results
#
#  avg_rating  :decimal(, )
#  driver_name :text
#  trip_count  :bigint
#
class SearchResult < ApplicationRecord
  # this isn't strictly necessary, but it will prevent
  # rails from calling save, which would fail anyway.
  def readonly?
    true
  end
end
