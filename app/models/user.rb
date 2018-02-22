class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_one :patient, required: false
  has_one :doctor, required: false

  enum role: ["admin", "patient", "provider"]

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.username = auth.info.name
      user.token = auth.credentials.token

      user.password = auth.info.password
    end
  end

end
