require 'rails_helper'

describe "Doctor Search API" do
  context "GET requests" do
    it "can get a list of all doctors with substring in their name" do
      create_list(:doctor, 1, name: "Lee", specialty: "PT")
      create_list(:doctor, 1, name: "Jay")
      create_list(:doctor, 1, name: "Leon")

      get "/api/v1/doctors?name=lee"
      expect(response).to be_success
      doctors = JSON.parse(response.body)
      expect(doctors.count).to eq 1
      expect(doctors.first).to be_a Hash
      expect(doctors.first["name"]).to eq "Lee"
      expect(doctors.first["specialty"]).to eq "PT"

      get "/api/v1/doctors?name=ja"
      expect(response).to be_success
      doctors = JSON.parse(response.body)
      expect(doctors.count).to eq 1
      expect(doctors.first).to be_a Hash
      expect(doctors.first["name"]).to eq "Jay"

      get "/api/v1/doctors?name=le"
      expect(response).to be_success
      doctors = JSON.parse(response.body)
      expect(doctors.count).to eq 2
      expect(doctors.first).to be_a Hash
      expect(doctors.first["name"]).to be_a String
    end
  end
end
