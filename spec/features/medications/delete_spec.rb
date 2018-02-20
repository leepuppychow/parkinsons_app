require 'rails_helper'

describe "When user visits My Medications" do
  it "can click on Remove to remove a medication" do
    patient = create(:patient)
    medication = create(:medication)
    pm1 = create(:patient_medication, medication: medication)
    pm1.note = Note.create(contents: "", noteable_id: pm1.id, noteable_type: pm1.class.name)
    patient.patient_medications << pm1

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_medications_path(patient)

    expect(page).to have_content(medication.name)
    expect(page).to have_content(patient.patient_medications.first.dosage)
    expect(page).to have_content(patient.patient_medications.first.freq_per_day)

    click_link "Remove"

    expect(current_path).to eq patient_medications_path(patient)
    expect(patient.patient_medications.count).to eq 0
  end
end
