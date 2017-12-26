require 'rails_helper'

describe "When a patient visits activity index" do
  it "can click on Edit link and be sent to a form to edit an activity" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    activity = create(:activity, patient: patient)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_activities_path(patient)

    click_on "Edit"

    expect(current_path).to eq edit_patient_activity_path(patient, activity)

    fill_in "activity[description]", with: "Run"
    fill_in "activity[duration]", with: 20
    fill_in "activity[date_performed]", with: Date.today

    click_button "Update Activity"

    #It does not even get to the update action in activities controller??

    expect(current_path).to eq patient_activities_path(patient)
    expect(page).to have_content 20
    expect(page).to have_content "Run"
  end
end
