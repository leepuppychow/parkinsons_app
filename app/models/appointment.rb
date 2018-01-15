class Appointment < ApplicationRecord
  validates :date_time, presence: true
  belongs_to :patient
  belongs_to :appointable, polymorphic: true
end
