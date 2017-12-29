require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on Edit Therapist and Edit therapist info with a form" do
    patient = create(:patient, role: 2)
    therapist = create(:therapist, therapy_type: "Physical Therapy")
    patient.therapists << therapist
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    click_link "Edit"
    expect(current_path).to eq edit_patient_therapist_path(patient, therapist)

    fill_in "therapist[first_name]", with: "Taylor"
    fill_in "therapist[last_name]", with: "McCulloch"
    select "Physical Therapy", :from => "therapist[therapy_type]"

    click_on "Update Therapist"

    expect(current_path).to eq patient_therapists_path(patient)
    expect(page).to have_content "Taylor"
    expect(page).to have_content "McCulloch"
    expect(page).to have_content "Physical Therapy"

  end

end
