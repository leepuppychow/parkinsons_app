require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on Edit Therapist and Edit therapist info with a form" do
    patient = create(:patient, role: 2)
    therapist = create(:therapist, specialty: "Physical Therapy")
    patient.therapists << therapist
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    click_link "Edit"
    expect(current_path).to eq edit_patient_therapist_path(patient, therapist)

    fill_in "therapist[name]", with: "Taylor McCulloch"
    fill_in "therapist[location]", with: "Denver"
    fill_in "therapist[phone]", with: "12345567890"
    select "Physical Therapy", :from => "therapist[specialty]"

    click_on "Update Therapist"

    expect(current_path).to eq patient_therapists_path(patient)
    expect(page).to have_content "Taylor"
    expect(page).to have_content "McCulloch"
    expect(page).to have_content "Physical Therapy"

  end

end
