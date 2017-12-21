require 'rails_helper'

describe "When Visitor visits app homepage" do
  context "Visitor can click on Visitor link" do
    it "sees a Visitor show page with limited access" do
      visitor = create(:patient, username: "visitor", password: "visitor", role: 0)

      visit root_path

      click_on "Visitor"

      expect(current_path).to eq visitor_welcome_index_path
      expect(page).to have_content "Today's Workout"
      expect(page).to have_content "Parkinson's on Twitter"
      expect(page).to have_content "Search for Articles"
    end
  end
end
