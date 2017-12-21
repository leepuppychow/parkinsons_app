require 'rails_helper'

describe "When Visitor visits their welcome page" do
  context "Visitor can click on Search for Articles" do
    it "Can see Pubmed search page" do
      visit visitor_welcome_index_path

      click_on "Search for Articles"

      expect(current_path).to eq visitor_articles_path
      expect(page).to have_content "Parkinson's Articles"
    end
  end
end
