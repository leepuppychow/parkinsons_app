require 'rails_helper'

describe Doctor, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:specialty)}
    it {is_expected.to validate_presence_of(:location)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:patients).through(:patient_doctors)}
  end
end
