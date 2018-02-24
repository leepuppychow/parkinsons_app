require 'rails_helper'

describe "When user visits My Medications (medications index path)" do
  it "can click on Edit to access form to edit a medication" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    medication = create(:medication)
    pm1 = create(:patient_medication, medication: medication)
    pm1.note = Note.create(contents: "", noteable_id: pm1.id, noteable_type: pm1.class.name)
    patient.patient_medications << pm1
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    visit patient_medications_path(patient)

    click_link "Edit"

    expect(current_path).to eq edit_patient_medication_path(patient, patient.patient_medications.first)
    fill_in "medication[name]", with: "Aspirin"
    fill_in "medication[patient_medications_attributes][0][dosage]", with: "600mg"
    fill_in "medication[patient_medications_attributes][0][freq_per_day]", with: 3
    click_on "Update Medication"

    expect(current_path).to eq patient_medications_path(patient)

    updated_medication = Medication.first
    expect(updated_medication.name).to eq "Aspirin"
    expect(updated_medication.patient_medications.count).to eq 1
    expect(updated_medication.patient_medications.first.dosage).to eq "600mg"
    expect(updated_medication.patient_medications.first.freq_per_day).to eq 3
  end
end
