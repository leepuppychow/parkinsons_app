require 'rails_helper'

describe "When user visits My Care Team page" do
  it "can click on Edit to edit doctor's information" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    doctor = create(:doctor)
    doctor.note = Note.create(contents: "", noteable_id: doctor.id, noteable_type: doctor.class.name)
    patient.doctors << doctor

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_doctors_path(patient)
    click_on "Edit"

    expect(current_path).to eq edit_patient_doctor_path(patient, doctor)

    fill_in "doctor[name]", with: "Sarah Smith"
    fill_in "doctor[phone]", with: "3031234556"
    select "Neurologist", :from => "doctor[specialty]"
    fill_in "doctor[location]", with: "Denver"

    click_on "Update Doctor"

    doctor = Doctor.first

    expect(current_path).to eq patient_doctors_path(patient)
    expect(doctor.name).to eq "Sarah Smith"
    expect(doctor.phone).to eq "3031234556"
    expect(doctor.specialty).to eq "Neurologist"
    expect(doctor.location).to eq "Denver"
  end
end
