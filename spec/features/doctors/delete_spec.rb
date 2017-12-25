require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on Remove to delete doctor" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    doctor = create(:doctor)
    patient.doctors << doctor

    visit patient_therapists_path(patient)

    expect(page).to have_content doctor.first_name

    click_on "Remove"

    expect(current_path).to eq patient_therapists_path(patient)

    expect(page).not_to have_content doctor.first_name
  end
end
