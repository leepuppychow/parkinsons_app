require 'rails_helper'

describe "When a patient visits activity index" do
  it "can click on Log Activity link and be sent to a form to add a new activity" do
    patient = create(:patient)

    visit patient_activities_path(patient)

    click_on "Log New Activity"

    expect(current_path).to eq new_patient_activity_path(patient)
    expect(page).to have_content "Log Activity Levels"
    expect(page).to have_content "Total(min)"
    expect(page).to have_content "Date"

    fill_in "activity[description]", with: "Did today's workout"
    fill_in "activity[duration]", with: "20"
    fill_in "activity[date_performed]", with: Date.today

    click_on "Log Activity"

    expect(current_path).to eq patient_activities_path(patient)
  end
end
