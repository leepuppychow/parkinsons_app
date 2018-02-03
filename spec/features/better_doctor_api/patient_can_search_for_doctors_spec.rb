require 'rails_helper'

describe "As a logged in user(patient)" do
  context "I can visit the find_doctor index page" do
    context "and fill in form to search for a doctor" do
      it "should return a list of doctors with name, address, phone, and insurance info" do
        patient = create(:patient, username: "LEE", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

        visit patient_find_doctor_index_path(patient)
        fill_in "city", with: "Denver"
        select "CO", from: "state"
        select "Neurologist", from: "specialty"
        click_on "Search!"

        expect(page).to have_css(".doctor-search", count: 16)
        within(first(".doctor-search")) do
          expect(page).to have_css(".name")
          expect(page).to have_css(".location")
          expect(page).to have_css(".phone")
        end
      end
    end
  end
end
