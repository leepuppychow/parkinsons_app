class Appointment < ApplicationRecord
  validates :date, :time, presence: true
  belongs_to :patient
  belongs_to :doctor

  scope :future, -> {where("date >= '#{DateTime.now}'")}
  scope :past, -> {where("date < '#{DateTime.now}'")}
  scope :today, -> {where(date: Date.today...Date.today+1)}
end
