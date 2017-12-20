class Exercise < ApplicationRecord
  validates :name, :description, :image, presence: true
  # has_many :patient_exercises
  # has_many :patients, through: :patient_exercises
  # accepts_nested_attributes_for :patient_exercises


  def self.pick_3_random
    find_by_sql("SELECT * FROM exercises
                ORDER BY RANDOM()
                LIMIT 3")
  end


end
