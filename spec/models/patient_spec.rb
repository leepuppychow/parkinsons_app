require 'rails_helper'

describe Patient, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_presence_of(:password)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:doctors).through(:patient_doctors)}
    it {is_expected.to have_many(:medications).through(:patient_medications)}
    it {is_expected.to have_many(:therapists).through(:therapist_patients)}
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

  describe "Instance Methods" do
    it "get 7 most recent days with activity and sum duration for each day" do
      patient = create(:patient)
      activity1 = create(:activity, patient: patient, duration: 30, date_performed: Date.today)
      activity2 = create(:activity, patient: patient, duration: 30, date_performed: Date.today)
      activity3 = create(:activity, patient: patient, duration: 30, date_performed: Date.today - 1)
      activity4 = create(:activity, patient: patient, duration: 40, date_performed: Date.today - 1)
      activity5 = create(:activity, patient: patient, duration: 80, date_performed: Date.today - 2)
      activity6 = create(:activity, patient: patient, duration: 40, date_performed: Date.today - 2)
      activity7 = create(:activity, patient: patient, duration: 40, date_performed: Date.today - 3)
      activity8 = create(:activity, patient: patient, duration: 50, date_performed: Date.today - 4)
      activity9 = create(:activity, patient: patient, duration: 60, date_performed: Date.today - 5)
      activity10 = create(:activity, patient: patient, duration: 70, date_performed: Date.today - 6)
      activity11 = create(:activity, patient: patient, duration: 10, date_performed: Date.today - 7)

      expected = {Date.today => 60,
                  Date.today-1 => 70,
                  Date.today-2 => 120,
                  Date.today-3 => 40,
                  Date.today-4 => 50,
                  Date.today-5 => 60,
                  Date.today-6 => 70}

      expect(patient.activities_with_duration_summed_per_day).to eq expected
    end
  end


end
