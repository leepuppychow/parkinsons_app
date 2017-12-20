require 'rails_helper'

describe Activity, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:duration)}
    it {is_expected.to validate_presence_of(:date_performed)}
  end

  describe "Relationships" do
    it "belongs_to patients" do
      is_expected.to belong_to(:patient)
    end
  end
end
