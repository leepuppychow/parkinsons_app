require 'rails_helper'

describe "When Visitor visits their welcome page" do
  context "It can click on Parkinson's on Twitter link" do
    it "sees the Parkinson's twitter feed page" do
      visit visitor_welcome_index_path

      click_on "Parkinson's on Twitter"

      expect(current_path).to eq visitor_twitter_index_path
      expect(page).to have_content "Parkinson's News"
    end
  end
end
