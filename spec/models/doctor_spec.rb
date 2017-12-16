require 'rails_helper'

describe Doctor, type: :model do
  describe "Validations" do
    it {is_expected to validate_presence_of(:first_name)}
    it {is_expected to validate_presence_of(:last_name)}
    it {is_expected to validate_presence_of(:specialty)}
    it {is_expected to validate_presence_of(:location)}
    it {is_expected to validate_presence_of(:years_experience)}
  end

  describe "Relationships" do
    doctor = create(:doctor)
    expect(doctor).to respond_to(:patients)
  end
end
