# == Schema Information
#
# Table name: trip_requests
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  end_location_id   :integer          not null
#  rider_id          :integer          not null
#  start_location_id :integer          not null
#
# Indexes
#
#  index_trip_requests_on_end_location_id    (end_location_id)
#  index_trip_requests_on_rider_id           (rider_id)
#  index_trip_requests_on_start_location_id  (start_location_id)
#
# Foreign Keys
#
#  fk_rails_...  (end_location_id => locations.id)
#  fk_rails_...  (rider_id => users.id)
#  fk_rails_...  (start_location_id => locations.id)
#
class TripRequest < ApplicationRecord
  belongs_to :rider, class_name: 'User'
  belongs_to :start_location, class_name: 'Location'
  belongs_to :end_location, class_name: 'Location'
  has_one :trip

  has_many :vehicle_reservations

  # A unique trip request could be per driver, start and end location, that is
  # in progress. In other words, in order to avoid duplicated data, require that
  # only trip could be in progress for a rider between the same locations.

  validates :rider, :start_location, :end_location, presence: true
end
