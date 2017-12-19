require 'rails_helper'

describe PatientExercise, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:duration)}
    it {is_expected.to validate_presence_of(:date_performed)}
  end

  describe "Relationships" do
    it {is_expected.to belong_to(:patient)}
    it {is_expected.to belong_to(:exercise)}
  end

end
