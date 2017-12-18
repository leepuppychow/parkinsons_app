require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on Remove to delete doctor" do
    patient = create(:patient)
    patient.doctor = create(:doctor)

    visit patient_therapists_path(patient)

    expect(page).to have_content patient.doctor.first_name

    click_on "Remove"

    expect(current_path).to eq patient_therapists_path(patient)

    expect(page).not_to have_content patient.doctor.first_name
  end
end
