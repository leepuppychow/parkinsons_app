require 'rails_helper'

describe Appointment do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:date_time)}
  end

  describe "Relationships" do
    it {is_expected.to belong_to :patient}
    it {is_expected.to belong_to :doctor}
  end
end
