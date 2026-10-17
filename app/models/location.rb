# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  city       :string
#  position   :point            not null
#  state      :string(2)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_locations_on_address         (address) UNIQUE
#  index_locations_on_city_and_state  (city,state) UNIQUE
#
class Location < ApplicationRecord
  validates :address,
            presence: true,
            uniqueness: true # simple approach, assumes fully address, all parts

  validates :position, presence: true
  validates :state,
            presence: true,
            length: { minimum: 2, maximum: 2 }

  geocoded_by :address

  after_validation :geocode, if: ->(obj) { obj.address_changed? && obj.position.nil? }
end
