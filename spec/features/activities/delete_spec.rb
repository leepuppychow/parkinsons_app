require 'rails_helper'

describe "When Patient visits activity index page" do
  it "he/she can click on Delete link to remove and activity" do
    patient = create(:patient, username: "test", password: "password", role: 2)
    activity = create(:activity, patient: patient)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)

    visit patient_activities_path(patient)

    expect(page).to have_content(activity.description)

    click_on "Remove"

    expect(current_path).to eq patient_activities_path(patient)
    expect(page).to_not have_content(activity.description)
  end
end
