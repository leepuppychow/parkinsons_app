require 'rails_helper'

describe "When user visits My Care Team" do
  it "can click on New Therapist and create new doctor with a form" do
    @patient = create(:patient)

    visit patient_therapists_path(@patient)

    click_link "New Therapist?"

    expect(current_path).to eq new_patient_therapist_path(@patient)
    expect(page).to have_content "Add New Therapist"
    expect(page).to have_content "First Name"
    expect(page).to have_content "Last Name"
    expect(page).to have_content "Type of Therapy"
    expect(page).to have_content "Experience"

    fill_in "therapist[first_name]", with: "Taylor"
    fill_in "therapist[last_name]", with: "McCulloch"
    select "Physical Therapy", :from => "therapist[type_of_therapy]"
    fill_in "therapist[years_experience]", with: 2

    # <th><%= f.label :category_id, class: "form-label" %></th>
    # <th><%= f.collection_select :category_id, Category.all, :id, :title, {}, id: "drop-down-menu" %></th>

    click_on "Add!"

    expect(current_path).to eq patient_therapists_path(@patient)
    expect(page).to have_content "Taylor"
    expect(page).to have_content "McCulloch"
    expect(page).to have_content 2
    expect(page).to have_content "Physical Therapy"

  end

end
