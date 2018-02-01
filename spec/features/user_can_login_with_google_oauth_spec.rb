require 'rails_helper'

describe "When a user visits the root path" do
  it "can click on a link to Login with Google account" do
    lee = create(:patient)
    stub_omniauth
    visit "/"

    click_on "Login with Google Account"
    expect(current_path).to eq patient_path(lee)
    expect(page).to have_content "Lee"
  end
end
