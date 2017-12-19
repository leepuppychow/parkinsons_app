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

end
