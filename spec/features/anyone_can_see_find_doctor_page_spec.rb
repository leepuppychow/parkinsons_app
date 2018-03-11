require 'rails_helper'

describe "when anyone visits their homepage" do
  context "when a Patient visits their homepage" do
    context "he/she can click on a link Find a Doctor" do
      it "will see a page with a form to search for a physician" do
        VCR.use_cassette("better_doctor_search") do
          user = create(:user)
          patient = create(:patient)
          user.patient = patient
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
          allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

          visit patient_find_doctor_index_path(patient)

          select "Neurologist", :from => "specialty"
          select "CO", :from => "state"
          fill_in "city", with: "Denver"

          click_on "Search!"

          expect(current_path).to eq patient_find_doctor_index_path(patient)
          expect(page).to have_css(".doctor-search", count: 20)
          within(first(".doctor-search")) do
            expect(page).to have_css(".name")
            expect(page).to have_css(".location")
            expect(page).to have_css(".phone")
            expect(page).to have_content "Insurance(s) Accepted"
          end
        end
      end
    end
  end

  # context "when a Visitor visits their homepage" do
  #   context "he/she can click on a link Find a Doctor" do
  #     it "will see a page with a form to search for a physician" do
  #       visit visitor_welcome_index_path
  #
  #       click_on "Find a Care Provider"
  #
  #       expect(current_path).to eq visitor_find_doctor_index_path
  #
  #       select "Neurologist", :from => "specialty"
  #       select "CO", :from => "state"
  #       fill_in "city", with: "Denver"
  #
  #       click_on "Search!"
  #
  #       expect(current_path).to eq visitor_find_doctor_index_path
  #     end
  #   end
  # end


end
