require 'rails_helper'

describe "Visitor signs up for account" do
  context "they visit the root page" do
    context "they click on registration link" do
      context "they fill in registration form" do
        it "can create a new account as a patient" do
          visit '/'

          click_on "Create New Account"

          expect(current_path).to eq(new_user_path)
          select "No", from: "provider"

          within(".new-patient-form") do
            fill_in "patient[first_name]", with: "Lee"
            fill_in "patient[last_name]", with: "Chow"
            fill_in "user[username]", with: "username"
            fill_in "user[password]", with: "password"
            click_on "Submit"
          end

          expect(page).to have_content("Lee")
          expect(Patient.first.first_name).to eq "Lee"
        end

        it "can create an account as a doctor/provider" do
          visit '/'

          click_on "Create New Account"

          expect(current_path).to eq(new_user_path)

          select "Yes", from: "provider"
          within ".new-doctor-form" do
            fill_in "doctor[name]", with: "Lee"
            select "Cardiologist", from: "doctor[specialty]"
            fill_in "doctor[location]", with: "123 ash st"
            fill_in "doctor[phone]", with: "1234567890"
            fill_in "user[username]", with: "username"
            fill_in "user[password]", with: "password"
            click_on "Submit"
          end

          expect(page).to have_content("Lee")
          expect(Doctor.first.name).to eq "Lee"
        end
      end
    end
  end
end
