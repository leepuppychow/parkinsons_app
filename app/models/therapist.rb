class Therapist < ApplicationRecord
  validates :name, :specialty, :location, :phone, presence: true
  has_many :therapist_patients
  has_many :patients, through: :therapist_patients
  has_one :note, as: :noteable, dependent: :destroy

  def self.uniq_therapy_type
    Therapist.pluck(:therapy_type).uniq
  end
end
