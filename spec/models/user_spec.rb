require 'rails_helper'

describe User do
  context "Relationships" do
    it "can have_one doctor" do
      user = create(:user)
      doctor = create(:doctor)
      user.doctor = doctor

      expect(user).to respond_to :doctor
    end

    it "can have_one_patient" do
      user = create(:user)
      patient = create(:patient)
      user.patient = patient

      expect(user).to respond_to :patient
    end
  end
end
