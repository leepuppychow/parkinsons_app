require 'rails_helper'

describe "A user visits doctor index page" do
  context "as an ADMIN" do
    it "allows admin to see all the doctors" do
      create_list(:patient, 10)

      admin = create(:patient, username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_patients_path
      expect(page).to have_content("Admin")
      expect(page).to have_content("All current patients")
    end
  end

  context "as a Visitor or Patient" do
    it "cannot see the admin patients index" do
      user = create(:patient, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_patients_path

      expect(page).to_not have_content("Admin")
      expect(page).to_not have_content("All current patients")
      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end
