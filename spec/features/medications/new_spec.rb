require 'rails_helper'

describe "When user visits My Medications (medication index path)" do
  # before(:each) do
  #   @patient = create(:patient)
  #   @medication1 = create(:medication)
  #   @medication2 = create(:medication)
  #   @patient.patient_medications << create(:patient_medication, medication: @medication1)
  #   @patient.patient_medications << create(:patient_medication, medication: @medication2)
  #
  # end

  it "user can click on New Medication link and see form for new medication" do
    patient = create(:patient)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_medications_path(patient)
    click_link "New Medication?"

    expect(current_path).to eq new_patient_medication_path(patient)
    expect(page).to have_content "My Medications"
    expect(page).to have_content "Home"
    expect(page).to have_content "Logout"
    expect(page).to have_content "Add New Medication"
    expect(page).to have_content "Name"
    expect(page).to have_content "Dosage"
    expect(page).to have_content "Frequency"

    fill_in "medication[name]", with: "Aspirin"
    fill_in "medication[new_medication][dosage]", with: "100mg"
    fill_in "medication[new_medication][freq_per_day]", with: 2

    click_on "Create Medication"

    expect(page).to have_content "Aspirin"
    expect(page).to have_content "100mg"
    expect(page).to have_content 2
    expect(current_path).to eq patient_medications_path(patient)
  end

end
