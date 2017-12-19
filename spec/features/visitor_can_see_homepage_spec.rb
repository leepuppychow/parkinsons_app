require 'rails_helper'

describe "When anyone (visitor, logged-in user, admin) visits homepage path" do
  it "sees a Welcome page with form to login or create new user" do
    visit root_path

    expect(page).to have_content("Health Tracker - Parkinson's")
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
    expect(page).to have_content "Login"
    expect(page).to have_content "Sign up as new user"
    expect(page).to have_content "Visit the site"
  end
end
