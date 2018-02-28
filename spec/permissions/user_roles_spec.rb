require 'rails_helper'

describe "Can check status of user" do
  it "can see if current user is a Patient" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient

    expect(user.is_patient?).to eq true
    expect(user.is_doctor?).to eq nil
  end

  it "can see if current user is a Doctor" do
    user = create(:user)
    doctor = create(:doctor)
    user.doctor = doctor

    expect(user.is_patient?).to eq nil
    expect(user.is_doctor?).to eq true
  end
end
