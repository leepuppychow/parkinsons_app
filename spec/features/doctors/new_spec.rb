require 'rails_helper'

describe "When user visits My Care Team page" do
  it "can click a New Doctor link to add a new physician" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)
    visit new_patient_doctor_path(patient)

    fill_in "doctor[name]", with: "Sarah Smith"
    fill_in "doctor[phone]", with: "3031234567"
    select "Neurologist", :from => "doctor[specialty]"
    fill_in "doctor[location]", with: "Denver"

    click_on "Add Doctor"

    expect(current_path).to eq patient_doctors_path(patient)
    expect(page).to have_content "Sarah"
    expect(page).to have_content "Smith"
    expect(page).to have_content "Neurologist"
  end
end
