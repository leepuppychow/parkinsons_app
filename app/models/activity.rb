class Activity < ApplicationRecord
  validates :duration, :date_performed, :description, presence: true
  belongs_to :patient

end
