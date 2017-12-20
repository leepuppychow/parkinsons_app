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
    it {is_expected.to have_many(:activities)}
  end

  describe "Authorizations" do
    it "can be created as an admin" do
      user = create(:patient, username: "admin", password: "password", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created as a visitor" do
      user = create(:patient, username: "admin", password: "password", role: 0)

      expect(user.role).to eq("visitor")
      expect(user.visitor?).to be_truthy
    end
  end


end

# it {should have_many(:movies)}
# it {is_expected.to have_many(:movies)}   #same thing as above
