require 'rails_helper'

describe "When user visits My Medications" do
  it "can click on Remove to remove a medication" do
    patient = create(:patient)
    medication = create(:medication)
    patient.patient_medications << create(:patient_medication, medication: medication)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_medications_path(patient)

    expect(page).to have_content(medication.name)
    expect(page).to have_content(patient.patient_medications.first.dosage)
    expect(page).to have_content(patient.patient_medications.first.freq_per_day)

    click_link "Remove"

    #This does hit medications#destroy, but does not get deleted in test enviroment???

    expect(current_path).to eq patient_medications_path(patient)
    expect(page).to_not have_content(medication.name)
  end
end
