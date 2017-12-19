require 'rails_helper'

describe Exercise, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:image)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:patients).through(:patient_exercises)}
  end

  describe "Class Methods" do
    it ".pick_3_random will get 3 random exercises from DB" do
      create_list(:exercise, 10)

      expect(Exercise.pick_3_random.count).to eq 3
      expect(Exercise.pick_3_random.first.class).to eq Exercise
    end
  end

end
