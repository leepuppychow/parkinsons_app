require 'rails_helper'

describe "A user visits exercise index page" do
  context "as an ADMIN" do
    it "allows admin to see all the exercises" do
      admin = create(:patient, username: "admin", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_exercises_path
      expect(page).to have_content("Admin")
      expect(page).to have_content("All Exercises")
    end
  end

  context "as a Visitor or Patient" do
    it "cannot see the admin exercises index" do
      user = create(:patient, role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_exercises_path

      expect(page).to_not have_content("Admin")
      expect(page).to_not have_content("All current exercises")
      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end
