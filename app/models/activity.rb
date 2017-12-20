class Activity < ApplicationRecord
  validates :duration, :date_performed, presence: true 
  belongs_to :patient

end
