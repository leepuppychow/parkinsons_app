require 'rails_helper'

describe "When user visits homepage" do
  context "he/she clicks on log in link" do
    context "he/she fills in username and password" do
      it "can now access their homepage (as a patient)" do
        user = create(:user)
        patient = create(:patient)
        user.patient = patient

        visit '/'
        fill_in "username", with: user.username
        fill_in "password", with: user.password
        click_on "Log In"

        expect(current_path).to eq patient_path(patient)
        expect(page).to have_content("#{patient.first_name}")
      end

      it "can access his/her homepage (as a doctor/provider)" do
        user = create(:user)
        doctor = create(:doctor)
        user.doctor = doctor

        visit '/'
        fill_in "username", with: user.username
        fill_in "password", with: user.password
        click_on "Log In"

        expect(current_path).to eq doctor_path(doctor)
        expect(page).to have_content("#{doctor.name}")

      end
    end
  end
end
