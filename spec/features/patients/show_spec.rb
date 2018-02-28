require 'rails_helper'

describe "As a user when I visit the user show page" do
  before(:each) do
    user = create(:user)
    @patient = create(:patient)
    user.patient = @patient

    @patient.doctors << create(:doctor)
    @patient.doctors << create(:doctor, name: "Taylor")

    @medication1 = create(:medication)
    @medication2 = create(:medication)
    @patient.patient_medications << create(:patient_medication, medication: @medication1)
    @patient.patient_medications << create(:patient_medication, medication: @medication2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@patient)
    allow_any_instance_of(ApplicationController).to receive(:user_from_sessions).and_return(user)

    visit patient_path(@patient)
  end

  it "sees a User welcome page with links to various tools" do
    expect(page).to have_content "Medication Reminders"
  end
end
