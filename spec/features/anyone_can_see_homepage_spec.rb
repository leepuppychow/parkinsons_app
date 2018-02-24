require 'rails_helper'

describe "When anyone (visitor, logged-in user, admin) visits homepage path" do
  it "sees a Welcome page with form to login or create new user" do
    visit root_path

    expect(page).to have_content "PD Health Tracker"
    expect(page).to have_content "Login with Google"
    expect(page).to have_content "Login with Facebook"
    expect(page).to have_content "Login"
    expect(page).to have_content "Create New Account"
  end
end
