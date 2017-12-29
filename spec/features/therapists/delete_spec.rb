require 'rails_helper'

describe "When user visits My Care Team page" do
  context "can click on Delete link next to a therapist name" do
    it "will delete that therapist" do
      patient = create(:patient, role: 2)
      patient.therapists.create(first_name: "joe", last_name: "s", therapy_type: "PT")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

      visit patient_therapists_path(patient)

      expect(page).to have_content "joe"

      click_on "Remove"

      expect(current_path).to eq patient_therapists_path(patient)
      expect(patient.therapist_patients.count).to eq 0
    end
  end
end
