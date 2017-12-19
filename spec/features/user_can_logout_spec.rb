require 'rails_helper'

describe "When a patient(logged-in user) is on their homepage" do
  context "They can click a link to Logout" do
    it "will take them to the root homepage path" do
      patient = create(:patient)

      visit '/'

      click_on "Log In"

      expect(current_path).to eq login_path

      fill_in "username", with: patient.username
      fill_in "password", with: patient.password

      click_on "Log In"

      expect(page).to have_content("Hi, #{patient.first_name}")
      expect(current_path).to eq patient_path(patient)

      click_on "Logout"

      expect(current_path).to eq "/"
    end
  end
end
