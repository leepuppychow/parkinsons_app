require 'rails_helper'

describe "When a patient(logged-in user) is on their homepage" do
  context "They can click a link to Logout" do
    it "will take them to the root homepage path" do
      user = create(:user)
      patient = create(:patient)
      user.patient = patient

      visit '/'

      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on "Log In"

      expect(page).to have_content("#{patient.first_name}")
      expect(current_path).to eq patient_path(patient)

      click_on "Logout"

      expect(current_path).to eq "/"
      expect(page).to_not have_content "#{patient.first_name}"
    end
  end
end
