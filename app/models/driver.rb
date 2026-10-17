# == Schema Information
#
# Table name: users(sensitive_fields|first_name:scrub_text,last_name:scrub_text,email:scrub_email)
#
#  id                     :bigint           not null, primary key
#  drivers_license_number :string(100)
#  email                  :string           not null
#  first_name             :string           not null
#  last_name              :string           not null
#  password_digest        :string
#  trips_count            :integer
#  type                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email      (email) UNIQUE
#  index_users_on_last_name  (last_name)
#
class Driver < User
  has_many :trips

  validates :drivers_license_number,
            presence: true,
            uniqueness: true,
            drivers_license: true

  # X out of 5, with 1 to 5 options selected by Riders
  def average_rating
    trips.average(:rating)
  end
end
