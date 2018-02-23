class Appointment < ApplicationRecord
  validates :date_time, presence: true
  belongs_to :patient
  belongs_to :doctor

  scope :future, -> {where("date_time >= '#{DateTime.now}'")}
  scope :past, -> {where("date_time < '#{DateTime.now}'")}
  scope :today, -> {where(date_time: Date.today...Date.today+1)}
end
