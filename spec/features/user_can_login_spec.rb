require 'rails_helper'

describe "When user visits homepage" do
  context "he/she clicks on log in link" do
    context "he/she fills in username and password" do
      it "can now access their homepage" do
        patient = create(:patient)

        visit '/'

        click_on "Log In"

        expect(current_path).to eq login_path

        fill_in "username", with: patient.username
        fill_in "password", with: patient.password

        click_on "Log In"

        expect(page).to have_content("Hi, #{patient.first_name}")
      end
    end
  end
end
