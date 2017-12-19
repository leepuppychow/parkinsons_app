require 'rails_helper'

describe "A user visits Patient index page" do
  context "as an ADMIN" do
    it "allows admin to see all the patients" do
      create_list(:patient, 10)
      
      admin = create(:patient, username: "admin", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_patients_path
      expect(page).to have_content("Admin")
      expect(page).to have_content("All current patients")
    end
  end
end
