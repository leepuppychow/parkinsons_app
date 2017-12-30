require 'rails_helper'

describe "When user visits My Care Team page" do
  it "can click a New Doctor link to add a new physician" do
    patient = create(:patient)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_therapists_path(patient)

    click_on "New Doctor?"

    expect(current_path).to eq new_patient_doctor_path(patient)
    expect(page).to have_content "Add New Doctor"
    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
    expect(page).to have_content "Specialty"
    expect(page).to have_content "Location"

    fill_in "doctor[first_name]", with: "Sarah"
    fill_in "doctor[last_name]", with: "Smith"
    select "Neurologist", :from => "doctor[specialty]"
    fill_in "doctor[location]", with: "Denver"

    click_on "Create Doctor"

    expect(current_path).to eq patient_therapists_path(patient)
    expect(page).to have_content "Sarah"
    expect(page).to have_content "Smith"
    expect(page).to have_content "Neurologist"
  end
end
