require 'rails_helper'

describe "When user visits My Medications (medication index path)" do
  before(:each) do
    @patient = create(:patient)
    @medication1 = create(:medication)
    @medication2 = create(:medication)
    @patient.patient_medications << create(:patient_medication, medication: @medication1)
    @patient.patient_medications << create(:patient_medication, medication: @medication2)

    visit patient_medications_path(@patient)
  end

  it "user can click on New Medication link and see form for new medication" do
    click_link "New Medication?"

    expect(current_path).to eq new_patient_medication_path(@patient)
    expect(page).to have_content "My Medications"
    expect(page).to have_content "Home"
    expect(page).to have_content "Logout"
    expect(page).to have_content "Add New Medication"
    expect(page).to have_content "Name:"
    # expect(page).to have_content "Dosage:"
    # expect(page).to have_content "Frequency:"
    expect(page).to have_content "Add!"
  end

end
