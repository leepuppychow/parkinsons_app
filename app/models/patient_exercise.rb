class PatientExercise < ApplicationRecord
  validates :duration, :date_performed, presence: true
  # belongs_to :patient
  # belongs_to :exercise
  #
  # accepts_nested_attributes_for :exercise

end
