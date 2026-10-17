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
#  index_users_on_drivers_license_number  (drivers_license_number) UNIQUE
#  index_users_on_email                   (email) UNIQUE
#  index_users_on_last_name               (last_name)
#
class Rider < User
  has_many :trip_requests
  has_many :trips, through: :trip_requests
end
