require 'rails_helper'

describe "When user visits My Medications" do
  before(:each) do
    @patient = create(:patient)
    @medication1 = create(:medication)
    @patient.patient_medications << create(:patient_medication, medication: @medication1)

    visit patient_medications_path(@patient)
  end

  it "can click on Remove to remove a medication" do
    expect(page).to have_content(@medication1.name)
    expect(page).to have_content(@patient.patient_medications.first.dosage)
    expect(page).to have_content(@patient.patient_medications.first.freq_per_day)

    click_link "Remove"

    expect(@patient.patient_medications.first).to eq nil
  end
end
