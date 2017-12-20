require 'rails_helper'

describe "When patient visits their homepage" do
  context "and clicks on Parkinson's News link" do
    it "can see a News Index page" do
      patient = create(:patient)

      visit patient_path(patient)

      click_on "Parkinson's Articles"

      expect(current_path).to eq patient_articles_path(patient)
      expect(page).to have_content "Parkinson's News"
    end
  end
end
