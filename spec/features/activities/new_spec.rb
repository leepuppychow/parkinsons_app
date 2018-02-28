require 'rails_helper'

describe "When a patient visits activity index" do
  it "can click on Log Activity link and be sent to a form to add a new activity" do
    user = create(:user)
    patient = create(:patient)
    user.patient = patient
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

    visit patient_exercises_path(patient)

    click_on "Log New Activity"

    expect(current_path).to eq new_patient_activity_path(patient)
    fill_in "activity[description]", with: "Did today's workout"
    fill_in "activity[duration]", with: 20
    fill_in "activity[date_performed]", with: "2017-12-25"

    click_on "Create Activity"

    expect(current_path).to eq patient_path(patient)
  end
end
