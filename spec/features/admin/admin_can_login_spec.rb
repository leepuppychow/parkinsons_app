require 'rails_helper'

describe "When the Admin visits the welcome page" do
  context "and clicks on Login link" do
    context "and enters username(admin) and password" do
      it "will see an Admin homepage" do
        admin = create(:user, username: "admin", password: "password")

        visit '/'

        fill_in "username", with: "admin"
        fill_in "password", with: "password"

        click_on "Log In"

        expect(current_path).to eq admin_welcome_index_path
        expect(page).to have_content "Patients Index"
        expect(page).to have_content "Doctors Index"
      end
    end
  end
end
