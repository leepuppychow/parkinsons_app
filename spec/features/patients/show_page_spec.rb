require 'rails_helper'

describe "As a user when I visit the user show page" do
  before(:each) do
    @patient = create(:patient)
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

  it "redirect to a Medications index page when My Medications is clicked" do
    click_link "My Medications"

    expect(current_path).to eq "/patient/#{@patient.id}/medications"

    expect(page).to have_content "My Medications"
    expect(page).to have_content "Add New Medication"
    expect(page).to have_content "Delete"
    expect(page).to have_content "Weekly Schedule"
  end

end
