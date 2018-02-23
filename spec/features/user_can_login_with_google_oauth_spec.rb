require 'rails_helper'

describe "When a user visits the root path" do
  it "can click on a link to Login with Google account as a Patient" do
    stub_omniauth
    visit "/"

    click_on "Login with Google"
    expect(current_path).to eq patient_path(Patient.last)
    expect(page).to have_content "lee"
  end
end
