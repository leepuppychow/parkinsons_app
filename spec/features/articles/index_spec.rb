require 'rails_helper'

describe "When patient visits their homepage" do
  context "and clicks on Parkinson's on Twitter link" do
    it "can see a Twitter Index page" do
      patient = create(:patient, username: "admin", password: "password", role: 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

      visit patient_path(patient)

      click_on "Parkinson's on Twitter"

      expect(current_path).to eq patient_article_path(patient, patient)
      expect(page).to have_content "Parkinson's on Twitter"
    end
  end
end
