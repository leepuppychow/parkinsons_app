require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on New Therapist and create new doctor with a form" do
    @patient = create(:patient)
    create(:therapist, therapy_type: "Physical Therapy")
    create(:therapist, therapy_type: "Occupational Therapy")
    create(:therapist, therapy_type: "Speech Therapy")

    visit patient_therapists_path(@patient)

    click_link "New Therapist?"

    expect(current_path).to eq new_patient_therapist_path(@patient)
    expect(page).to have_content "Add New Therapist"
    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
    expect(page).to have_content "Therapy type"
    expect(page).to have_content "Experience"


    fill_in "therapist[first_name]", with: "Taylor"
    fill_in "therapist[last_name]", with: "McCulloch"
    select "Physical Therapy", :from => "therapist[therapy_type]"
    fill_in "therapist[years_experience]", with: 2

    click_on "Add!"

    expect(current_path).to eq patient_therapists_path(@patient)
    expect(page).to have_content "Taylor"
    expect(page).to have_content "McCulloch"
    expect(page).to have_content 2
    expect(page).to have_content "Physical Therapy"

  end

end