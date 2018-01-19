class Appointment < ApplicationRecord
  validates :date_time, presence: true
  belongs_to :patient
  belongs_to :appointable, polymorphic: true
  scope :future, -> {where("date_time >= '#{Date.today}'")}
  scope :past, -> {where("date_time < '#{Date.today}'")}

end
