require 'rails_helper'

describe "When user visits My Care Team page" do
  it "can click on Edit to edit doctor's information" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    patient.doctors << doctor

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)
    click_on "Edit"

    expect(current_path).to eq edit_patient_doctor_path(patient, doctor)

    fill_in "doctor[first_name]", with: "Sarah"
    fill_in "doctor[last_name]", with: "Smith"
    fill_in "doctor[specialty]", with: "Neuro"
    fill_in "doctor[location]", with: "Denver"

    click_on "Update Doctor"

    expect(current_path).to eq patient_therapists_path(patient)
    expect(page).to have_content "Sarah"
    expect(page).to have_content "Smith"
    expect(page).to have_content "Neuro"
  end
end
