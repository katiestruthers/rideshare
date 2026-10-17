# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  status     :enum             default("draft"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_vehicles_on_name  (name) UNIQUE
#
class Vehicle < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true

  attr_accessor :status

  has_many :vehicle_reservations, dependent: :destroy

  enum :status, {
    draft: VehicleStatus::DRAFT,
    published: VehicleStatus::PUBLISHED
  }, prefix: true

  validates :status,
            inclusion: { in: VehicleStatus::VALID_STATUSES },
            presence: true
end
