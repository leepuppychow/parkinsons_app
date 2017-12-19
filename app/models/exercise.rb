class Exercise < ApplicationRecord
  validates :name, :description, :image, presence: true
  has_many :patient_exercises
  has_many :patients, through: :patient_exercises 

end
