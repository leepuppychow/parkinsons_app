class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_one :patient, required: false
  has_one :doctor, required: false

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.username = auth.info.name
      user.token = auth.credentials.token
      user.password = "google_oauth2"
    end
  end

end
