require 'rails_helper'

describe "As a user when I visit the user show page" do
  before(:each) do
    @patient = create(:patient)
    @medication1 = create(:medication)
    @medication2 = create(:medication)
    @patient.patient_medications << create(:patient_medication, medication: @medication1)
    @patient.patient_medications << create(:patient_medication, medication: @medication2)

    visit patient_path(@patient)
  end

  it "sees a User welcome page with links to various tools" do
    expect(page).to have_content "Logout"
    expect(page).to have_content "Hi #{@patient.first_name}"
    expect(page).to have_content "My Care Team"
    expect(page).to have_content "My Medications"
    expect(page).to have_content "Exercise Tools"
    expect(page).to have_content "Parkinson's News"
    expect(page).to have_content "Nearby Resources"
    expect(page).to have_content "My Journal"
    expect(page).to have_content "Community"
  end

  it "when My Medications is clicked it takes me to an index of my meds" do
    click_link "My Medications"

    expect(current_path).to eq "/patients/#{@patient.id}/medications"

    expect(page).to have_content "#{@patient.first_name}'s Medications"
    expect(page).to have_content "Remove"
    expect(page).to have_content "Edit"
    expect(page).to have_content "REMEMBER TO TAKE"
    expect(page).to have_content @patient.patient_medications.first.dosage
    expect(page).to have_content @patient.patient_medications.last.medication.name
    expect(page).to have_content "New Medication?"
  end

end
