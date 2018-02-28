require 'rails_helper'

describe "As a logged in user(patient)" do
  context "I can visit the find_doctor index page" do
    context "and fill in form to search for a doctor" do
      it "should return a list of doctors with name, address, phone, and insurance info" do
        VCR.use_cassette("neurologists") do
          user = create(:user)
          patient = create(:patient)
          user.patient = patient
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
          allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

          visit patient_find_doctor_index_path(patient)
          fill_in "city", with: "Denver"
          select "CO", from: "state"
          select "Neurologist", from: "specialty"
          click_on "Search!"

          expect(page).to have_css(".doctor-search", count: 20)
          within(first(".doctor-search")) do
            expect(page).to have_css(".name")
            expect(page).to have_css(".location")
            expect(page).to have_css(".phone")
          end
        end
      end
    end
  end
end
