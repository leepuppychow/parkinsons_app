require 'rails_helper'

describe Medication, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "Relationships" do
    it "has many patients" do
      is_expected.to have_many(:patients).through(:patient_medications)
    end

    it "has one note" do
      is_expected.to have_one(:note)
    end
  end

end
