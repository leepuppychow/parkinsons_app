require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on Remove to delete doctor" do
    patient = create(:patient, role: 2)
    doctor = create(:doctor)
    patient.doctors << doctor
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    expect(page).to have_content doctor.first_name

    click_on "Remove"

    expect(current_path).to eq patient_therapists_path(patient)
    expect(page).to_not have_content doctor.first_name
  end
end
