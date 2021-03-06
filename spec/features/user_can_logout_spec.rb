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

      expect(current_path).to eq patient_path(patient)
      click_on "logout"

      expect(current_path).to eq "/"
    end
  end
end
