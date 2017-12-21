require 'rails_helper'

describe "When Patient visits activity index page" do
  it "he/she can click on Delete link to remove and activity" do
    patient = create(:patient)
    activity = create(:activity, patient: patient)

    visit patient_activities_path(patient)

    expect(page).to have_content(activity.description)

    click_on "Remove"

    expect(current_path).to eq patient_activities_path(patient)
    expect(page).to_not have_content(activity.description)
  end
end
