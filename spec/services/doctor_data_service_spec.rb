require 'rails_helper'

describe DoctorDataService do

  it "exists" do
    doctor_data = DoctorDataService.new("Denver", "CO", "neurologist")
    expect(doctor_data).to be_a DoctorDataService
  end

  
end
