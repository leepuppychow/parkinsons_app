require 'rails_helper'

describe "When anyone (visitor, logged-in user, admin) visits homepage path" do
  it "sees a Welcome page with form to login or create new user" do
    visit root_path

    expect(page).to have_content "Health Tracker (Parkinson's)"
    expect(page).to have_content "New user?"
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Already have an account?"
    expect(page).to have_content "Log In"
    expect(page).to have_content "Check out the app!"
    expect(page).to have_content "Visitor"
  end
end
