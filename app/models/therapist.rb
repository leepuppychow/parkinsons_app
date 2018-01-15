class Therapist < ApplicationRecord
  validates :name, :specialty, :location, :phone, presence: true
  has_many :therapist_patients
  has_many :patients, through: :therapist_patients
  has_one :note, as: :noteable, dependent: :destroy
  has_many :appointments, as: :appointable 
  #
  # def self.uniq_specialty
  #   Therapist.pluck(:specialty).uniq
  # end
end
