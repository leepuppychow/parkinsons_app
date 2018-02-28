require 'rails_helper'

describe "A user visits doctor index page" do
  context "as an ADMIN" do
    it "allows admin to see all the medications" do
      admin = create(:user, username: "admin", password: "password")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(admin)

      visit admin_medications_path
      expect(page).to have_content("All Medications")
    end
  end

  context "as a Visitor or Patient" do
    it "cannot see the admin medications index" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect{ visit admin_medications_path }.to raise_error(ActionController::RoutingError)
    end
  end
end
