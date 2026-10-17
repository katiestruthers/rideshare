# == Schema Information
#
# Table name: trip_positions
#
#  id         :bigint           not null, primary key
#  position   :point            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trip_id    :bigint           not null
#
# Indexes
#
#  index_trip_positions_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_id => trips.id)
#
class TripPosition < ApplicationRecord
  belongs_to :trip

  validates :trip_id, presence: true
  validates :position, presence: true
end
