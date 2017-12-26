require 'rails_helper'

describe "When user visits My Medications (medications index path)" do
  it "can click on Edit to access form to edit a medication" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    medication1 = create(:medication)
    patient.patient_medications << create(:patient_medication, medication: medication1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    visit patient_medications_path(patient)

    click_link "Edit"

    expect(current_path).to eq edit_patient_medication_path(patient, patient.patient_medications.first)
    expect(page).to have_content "Edit Medication"
    expect(page).to have_content "Name"
    expect(page).to have_content "Dosage"
    expect(page).to have_content "Frequency"

    fill_in "medication[name]", with: "Aspirin"
    fill_in "medication[patient_medications_attributes][0][dosage]", with: "600mg"
    fill_in "medication[patient_medications_attributes][0][freq_per_day]", with: 3
    click_on "Update Medication"

    expect(current_path).to eq patient_medications_path(patient)
    expect(page).to have_content "Aspirin"
    expect(page).to have_content "600mg"
  end
end
