require 'rails_helper'

describe "when anyone visits their homepage" do
  context "when a Patient visits their homepage" do
    context "he/she can click on a link Find a Doctor" do
      it "will see a page with a form to search for a physician" do
        patient = create(:patient)

        visit patient_path(patient)

        click_on "Find a Doctor"

        expect(current_path).to eq patient_find_doctor_index_path(patient)

        fill_in "specialty", with: "Neurologist"
        fill_in "city", with: "Denver"
        fill_in "state", with: "CO"
        fill_in "gender", with: "male"
        fill_in "first_name", with: ""
        fill_in "last_name", with: ""

        click_on "Search!"

        expect(current_path).to eq patient_find_doctor_index_path(patient)
      end
    end
  end

  context "when a Visitor visits their homepage" do
    context "he/she can click on a link Find a Doctor" do
      it "will see a page with a form to search for a physician" do
        skip
        visit visitor_welcome_index_path

        click_on "Find a Doctor"

        expect(current_path).to eq visitor_finddoctor_index_path
        expect(page).to have_content "Specialty"
        expect(page).to have_content "City"
        expect(page).to have_content "State"
        expect(page).to have_content "Gender"
        expect(page).to have_content "First name"
        expect(page).to have_content "Last name"
      end
    end
  end


end
