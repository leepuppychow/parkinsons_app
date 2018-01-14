class Doctor < ApplicationRecord
  validates :name,
            :specialty,
            :phone,
            :location, presence: true
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors
  has_one :note, as: :noteable, dependent: :destroy
end
