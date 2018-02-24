class Appointment < ApplicationRecord
  validates :date, :time, presence: true
  belongs_to :patient
  belongs_to :doctor

  scope :future, -> {where("date >= '#{DateTime.now}'")}
  scope :past, -> {where("date < '#{DateTime.now}'")}
  scope :today, -> {where(date: Date.today...Date.today+1)}

  # This method is needed for simple_calendar gem
  def start_time
    self.date
  end

  def pretty_time
    time.strftime("%I:%M %p")
  end

end
