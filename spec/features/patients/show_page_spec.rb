require 'rails_helper'

describe "As a user when I visit the user show page" do
  it "sees a User welcome page with links to various tools" do
    patient = create(:patient)

    visit patient_path(patient)

    expect(page).to have_content "Logout"
    expect(page).to have_content "Hi #{patient.first_name}"
    expect(page).to have_content "My Care Team"
    expect(page).to have_content "My Medications"
    expect(page).to have_content "Exercise Tools"
    expect(page).to have_content "Parkinson's News"
    expect(page).to have_content "Nearby Resources"
    expect(page).to have_content "My Journal"
    expect(page).to have_content "Community"
  end

end
