require 'rails_helper'

describe Doctor, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:phone)}
    it {is_expected.to validate_presence_of(:location)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:patients).through(:patient_doctors)}
    it {is_expected.to have_one(:note)}
    it {is_expected.to have_many(:appointments)}
  end
end
