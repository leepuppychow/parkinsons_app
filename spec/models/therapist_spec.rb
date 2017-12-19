require 'rails_helper'

describe Therapist, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:therapy_type)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:patients).through(:therapist_patients)}
  end

end
