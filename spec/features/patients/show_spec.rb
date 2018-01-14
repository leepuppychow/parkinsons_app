require 'rails_helper'

describe "As a user when I visit the user show page" do
  before(:each) do
    @patient = create(:patient, username: "test", password: "password", role: 2)
    @patient.doctors << create(:doctor)

    @medication1 = create(:medication)
    @medication2 = create(:medication)
    @patient.patient_medications << create(:patient_medication, medication: @medication1)
    @patient.patient_medications << create(:patient_medication, medication: @medication2)

    @patient.therapists << create(:therapist)
    @patient.therapists << create(:therapist, name: "Taylor")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@patient)
    visit patient_path(@patient)
  end

  it "sees a User welcome page with links to various tools" do
    expect(page).to have_content "Logout"
    expect(page).to have_content "Hi, #{@patient.first_name}"
    expect(page).to have_content "My Care Team"
    expect(page).to have_content "My Medications"
    expect(page).to have_content "Today's Workout"
    expect(page).to have_content "Activity Tracker"
    expect(page).to have_content "Search for Articles"
    expect(page).to have_content "Find a Care Provider"
    expect(page).to have_content "Community"
  end

  it "when My Medications is clicked it takes me to an index of my meds" do
    click_link "My Medications"

    expect(current_path).to eq patient_medications_path(@patient)
    expect(page).to have_content "#{@patient.first_name}'s Medications"
    expect(page).to have_content "Remove"
    expect(page).to have_content "Edit"
    expect(page).to have_content "Remember to Take"
    expect(page).to have_content @patient.patient_medications.first.dosage
    expect(page).to have_content @patient.patient_medications.last.medication.name
    expect(page).to have_content "New Medication?"
  end

  it "when My Care Team is clicked it takes me to and index page showing
      my doctors and current therapists" do
    click_link "My Care Team"

    expect(current_path).to eq patient_therapists_path(@patient)
    expect(page).to have_content "My Care Team"
    expect(page).to have_content "DOCTOR"
    expect(page).to have_content "THERAPIST(S)"
    expect(page).to have_content "Yimeng"
    expect(page).to have_content "Taylor"
  end
end
