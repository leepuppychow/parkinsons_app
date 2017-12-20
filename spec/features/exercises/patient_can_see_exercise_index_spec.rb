require 'rails_helper'

describe "When a patient(logged in user) visits their homepage" do
  context "he/she can click on Today's Workout" do
    it "and is able to see an exercise index page" do
      patient = create(:patient)
      create_list(:exercise, 10)

      visit patient_path(patient)

      click_on "My Exercises"

      expect(current_path).to eq patient_exercises_path(patient)

      expect(page).to have_content "Today's Workout"
    end

    it "can click on DONE! link and be sent to a form to add a new exercise" do
      patient = create(:patient)
      exercise1 = create(:exercise, name: "Lunge")
      exercise2 = create(:exercise)
      exercise3 = create(:exercise)

      visit patient_exercises_path(patient)

      # within("//div[@id='Lunge']") do
      #   click_on "Done!"
      # end
      click_on "Log Exercise"

      expect(current_path).to eq new_patient_exercise_path(patient)
      expect(page).to have_content "Log Today's Exercise"
      expect(page).to have_content "Total(min)"
      expect(page).to have_content "Date"

      # fill_in "exercise[name]", with: exercise1.name
      fill_in "exercise[exercise][duration]", with: "20"
      fill_in "exercise[exercise][date_performed]", with: Date.today

      click_on "Log Exercise"

      expect(current_path).to eq patient_exercises_path(patient)
    end
  end
end
