require 'rails_helper'

describe Patient, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_presence_of(:password)}
    it {is_expected.to validate_presence_of(:age)}
  end

  describe "Relationships" do
    it {is_expected.to belong_to(:doctor)}
    it {is_expected.to have_many(:medications).through(:patient_medications)}
    it {is_expected.to have_many(:therapists).through(:therapist_patients)}
    # it {is_expected.to have_many(:exercises).through(:patient_exercises)}
  end


end

# it {should have_many(:movies)}
# it {is_expected.to have_many(:movies)}   #same thing as above
