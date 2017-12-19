require 'rails_helper'

describe "User signs up for account" do
  context "they visit the root page" do
    context "they click on registration link" do
      context "they fill in registration form" do
        it "a new user account is created " do
          visit '/'

          click_on "Sign Up"

          expect(current_path).to eq(new_patient_path)

          fill_in "patient[first_name]", with: "Lee"
          fill_in "patient[last_name]", with: "Chow"
          fill_in "patient[username]", with: "funbucket13"
          fill_in "patient[password]", with: "test"
          fill_in "patient[age]", with: 56

          click_on "Submit"

          expect(page).to have_content("Hi Lee")
        end
      end
    end
  end
end
