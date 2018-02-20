require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on Edit Therapist and Edit therapist info with a form" do
    patient = create(:patient, role: 2)
    therapist = create(:therapist)
    therapist.note = Note.create(contents: "", noteable_id: therapist.id, noteable_type: therapist.class.name)
    patient.therapists << therapist

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    click_link "Edit"
    expect(current_path).to eq edit_patient_therapist_path(patient, therapist)

    fill_in "therapist[name]", with: "Taylor McCulloch"
    fill_in "therapist[location]", with: "Denver"
    fill_in "therapist[phone]", with: "12345567890"
    select "PT", :from => "therapist[specialty]"

    click_on "Update Therapist"

    expect(current_path).to eq patient_therapists_path(patient)

    updated_therapist = Therapist.first
    expect(updated_therapist.name).to eq "Taylor McCulloch"
    expect(updated_therapist.location).to eq "Denver"
    expect(updated_therapist.phone).to eq "12345567890"
    expect(updated_therapist.specialty).to eq "PT"
  end

end
