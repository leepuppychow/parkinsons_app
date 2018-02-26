class Appointment < ApplicationRecord
  validates :date, :time, presence: true
  belongs_to :patient
  belongs_to :doctor

  scope :future, -> {where("date >= '#{DateTime.now}'")}
  scope :past, -> {where("date < '#{DateTime.now}'")}
  scope :today, -> {where(date: Date.today...Date.today+1)}
  scope :sorted_by_time, -> {order(:time)}
  scope :sorted_by_date, -> {order(:date)}

  # This method is needed for simple_calendar gem
  def start_time
    self.date
  end

  def pretty_time
    time.strftime("%I:%M %p")
  end

  def past_appointment?
    return true if date < Date.today
  end

end
