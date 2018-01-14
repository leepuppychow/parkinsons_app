require 'rails_helper'

describe Therapist, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:location)}
    it {is_expected.to validate_presence_of(:phone)}
    it {is_expected.to validate_presence_of(:specialty)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:patients).through(:therapist_patients)}
    it {is_expected.to have_one(:note)}
  end

end
