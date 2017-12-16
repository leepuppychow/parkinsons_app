require 'rails_helper'

describe PatientMedication, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:dosage)}
    it {is_expected.to validate_presence_of(:freq_per_day)}
  end

  describe "Relationships" do
    it {is_expected.to belong_to(:patient)}
    it {is_expected.to belong_to(:medication)}
  end

end
