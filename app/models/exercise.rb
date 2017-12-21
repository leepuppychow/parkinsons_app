class Exercise < ApplicationRecord
  validates :name, :description, :image, presence: true

  def self.pick_3_random
    find_by_sql("SELECT * FROM exercises
                ORDER BY RANDOM()
                LIMIT 3")
  end
end
