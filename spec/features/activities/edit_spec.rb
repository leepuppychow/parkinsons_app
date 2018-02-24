# require 'rails_helper'
#
# describe "When a patient visits activity index" do
#   it "can click on Edit link and be sent to a form to edit an activity" do
#     user = create(:user)
#     patient = create(:patient)
#     user.patient = patient
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patient)
#
#     activity = create(:activity, patient: patient)
#
#     visit patient_activities_path(patient)
#
#     click_on "Edit"
#
#     expect(current_path).to eq edit_patient_activity_path(patient, activity)
#
#     fill_in "activity[description]", with: "Run"
#     fill_in "activity[duration]", with: 20
#     fill_in "activity[date_performed]", with: Date.today
#     click_button "Update Activity"
#
#     expect(current_path).to eq patient_activities_path(patient)
#     expect(page).to have_content 20
#     expect(Activity.first.description).to eq "Run"
#   end
# end
