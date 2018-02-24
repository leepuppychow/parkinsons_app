require 'rails_helper'

describe "A user visits doctor index page" do
  context "as an ADMIN" do
    it "allows admin to see all the doctors" do
      create_list(:patient, 10)

      admin = create(:user, username: "admin", password: "password")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_doctors_path
      expect(page).to have_content("All Current Providers")
    end
  end

  context "as a Visitor or Patient" do
    it "cannot see the admin doctors index" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_doctors_path

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end
