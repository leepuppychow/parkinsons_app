require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on New Therapist and create new therapist with a form" do
    patient = create(:patient, role: 2)
    therapist = create(:therapist, specialty: "Physical Therapy")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    click_link "New Therapist?"
    expect(current_path).to eq new_patient_therapist_path(patient)

    fill_in "therapist[name]", with: "Taylor McCulloch"
    fill_in "therapist[location]", with: "Denver"
    fill_in "therapist[phone]", with: "12345567890"
    select "PT", :from => "therapist[specialty]"

    click_on "Create Therapist"

    expect(current_path).to eq patient_therapists_path(patient)
    expect(page).to have_content "Taylor"
    expect(page).to have_content "McCulloch"
    expect(page).to have_content "PT"

  end

end
