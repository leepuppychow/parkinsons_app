require 'rails_helper'

describe "As a user when I visit the user show page" do
  before(:each) do
    user = create(:user)
    @patient = create(:patient)
    user.patient = @patient

    @patient.doctors << create(:doctor)
    @patient.doctors << create(:doctor, name: "Taylor")

    @medication1 = create(:medication)
    @medication2 = create(:medication)
    @patient.patient_medications << create(:patient_medication, medication: @medication1)
    @patient.patient_medications << create(:patient_medication, medication: @medication2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@patient)
    visit patient_path(@patient)
  end

  it "sees a User welcome page with links to various tools" do
    expect(page).to have_content "Medication Reminders"
    expect(page).to have_content "Activity Levels"
  end

  # it "when My Medications is clicked it takes me to an index of my meds" do
  #   click_link "My Medications"
  #
  #   expect(current_path).to eq patient_medications_path(@patient)
  #   expect(page).to have_content "#{@patient.first_name}'s Medications"
  #   expect(page).to have_content "Remove"
  #   expect(page).to have_content "Edit"
  #   expect(page).to have_content "Remember to Take"
  #   expect(page).to have_content @patient.patient_medications.first.dosage
  #   expect(page).to have_content @patient.patient_medications.last.medication.name
  #   expect(page).to have_content "New Medication?"
  # end
  #
  # it "when My Care Team is clicked it takes me to and index page showing
  #     my doctors" do
  #   click_link "My Care Team"
  #
  #   expect(current_path).to eq patient_doctors_path(@patient)
  #   expect(page).to have_content "My Care Team"
  #   expect(page).to have_content "DOCTOR"
  #   expect(page).to have_content "Yimeng"
  #   expect(page).to have_content "Taylor"
  # end
end
