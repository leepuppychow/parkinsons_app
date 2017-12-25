require 'rails_helper'

describe "when anyone visits their homepage" do
  context "when a Patient visits their homepage" do
    context "he/she can click on a link Find a Doctor" do
      it "will see a page with a form to search for a physician" do
        patient = create(:patient, username: "test", password: "password", role: 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

        visit patient_path(patient)

        click_on "Find a Care Provider"

        expect(current_path).to eq patient_find_doctor_index_path(patient)

        select "Neurologist", :from => "specialty"
        select "CO", :from => "state"
        fill_in "city", with: "Denver"

        click_on "Search!"

        expect(current_path).to eq patient_find_doctor_index_path(patient)
      end
    end
  end

  context "when a Visitor visits their homepage" do
    context "he/she can click on a link Find a Doctor" do
      it "will see a page with a form to search for a physician" do
        visit visitor_welcome_index_path

        click_on "Find a Care Provider"

        expect(current_path).to eq visitor_find_doctor_index_path

        select "Neurologist", :from => "specialty"
        select "CO", :from => "state"
        fill_in "city", with: "Denver"

        click_on "Search!"

        expect(current_path).to eq visitor_find_doctor_index_path
      end
    end
  end


end
