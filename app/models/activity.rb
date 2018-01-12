class Activity < ApplicationRecord
  validates :duration, :date_performed, :description, presence: true
  belongs_to :patient
  scope :sort_by, -> (feature){order("#{feature} DESC")}

end
