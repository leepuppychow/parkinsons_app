require 'rails_helper'

describe "When patient visits their homepage" do
  context "and clicks on Parkinson's on Twitter link" do
    it "can see a Twitter Index page" do
      user = create(:user)
      patient = create(:patient)
      user.patient = patient
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
      allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

      visit patient_articles_path(patient)

      expect(page).to have_content "Tweets about Parkinsons"
      expect(page).to have_content "PubMed Article Search"
    end
  end
end
