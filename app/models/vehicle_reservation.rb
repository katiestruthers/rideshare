# == Schema Information
#
# Table name: vehicle_reservations
#
#  id              :bigint           not null, primary key
#  canceled        :boolean          default(FALSE), not null
#  ends_at         :timestamptz      not null
#  starts_at       :timestamptz      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  trip_request_id :integer          not null
#  vehicle_id      :integer          not null
#
# Indexes
#
#  index_vehicle_reservations_on_trip_request_id  (trip_request_id)
#  index_vehicle_reservations_on_vehicle_id       (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_request_id => trip_requests.id)
#  fk_rails_...  (vehicle_id => vehicles.id)
#
class VehicleReservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :trip_request

  validates :vehicle_id, :starts_at, :ends_at,
            presence: true

  validates :canceled,
            inclusion: { in: [true, false] }
end
