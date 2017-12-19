require 'rails_helper'

describe "When the Admin visits the welcome page" do
  context "and clicks on Login link" do
    context "and enters username(admin) and password" do
      it "will see an Admin homepage" do
        create(:patient, username: "admin", password: "admin", role: 1)

        visit '/'

        click_on "Log In"

        fill_in "username", with: "admin"
        fill_in "password", with: "admin"

        click_on "Log In"

        expect(current_path).to eq admin_welcome_index_path
        expect(page).to have_content "Welcome Admin!"
      end
    end
  end
end
