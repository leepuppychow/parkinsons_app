require 'rails_helper'

describe DoctorDataService do
  let(:doctor_data) {DoctorDataService.new("denver", "co", "neurologist")}

  it "exists" do
    expect(doctor_data).to be_a DoctorDataService
  end

  context "Instance Methods" do
    context "#practices" do
      it "returns collection of practices" do
        VCR.use_cassette("neurologists") do
          practices = doctor_data.practices
          expect(practices).to be_a Array
          expect(practices.first).to be_a Practice
          expect(practices.first.name).to be_a String
          expect(practices.first.phone).to be_a String
          expect(practices.first.location).to be_a String
          expect(practices.first.insurances).to be_a Array
          expect(practices.first.insurances.first).to be_a String
        end
      end
    end
  end
end
