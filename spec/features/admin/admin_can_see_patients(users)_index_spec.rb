require 'rails_helper'

describe "A user visits Patient index page" do
  context "as an ADMIN" do
    it "allows admin to see all the patients" do
      create_list(:patient, 10)

      admin = create(:user, username: "admin", password: "password")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(admin)

      visit admin_patients_path
      expect(page).to have_content("All Patients")
    end
  end

  context "as a Visitor" do
    it "cannot see the admin patients index" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect{ visit admin_patients_path }.to raise_error(ActionController::RoutingError)
    end
  end

  context "as a Patient(logged-in user)" do
    it "cannot see the admin patients index" do
      user = create(:user)
      patient = create(:patient)
      user.patient = patient

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect{ visit admin_patients_path }.to raise_error(ActionController::RoutingError)
    end
  end
end
