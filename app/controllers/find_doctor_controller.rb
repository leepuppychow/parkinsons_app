class FindDoctorController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
    @doctors = []
    @specialties = ["Neurologist", "Cardiologist", "Pediatrician", "Physical-Therapist", "Occupational-Therapist", "Speech-Therapist"]
  end

  def create
    @patient = Patient.find(params[:patient_id])
    city = params[:city].strip.downcase
    state = params[:state].strip.downcase
    specialty = params[:specialty].strip.downcase
    @specialties = ["Neurologist", "Cardiologist", "Pediatrician", "Physical-Therapist", "Occupational-Therapist", "Speech-Therapist"]

  #34f9ff67082e6e43cfb2dc335e45decf
    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{specialty}&location=#{state}-#{city}&limit=20&user_key=34f9ff67082e6e43cfb2dc335e45decf")

    data = JSON.parse(response.body)

    # @doctors = {
    #   names: [],
    #   addresses: [],
    #   phone_numbers: []
    # }

    @doctors = []

    if data["data"]
      data["data"].each do |practice|
        # @doctors[:names] << practice["practices"].first["name"]
        # @doctors[:addresses] <<
        #   practice["practices"].first["visit_address"]["street"] + " " +
        #   practice["practices"].first["visit_address"]["city"] + ", " +
        #   practice["practices"].first["visit_address"]["state"] + " " +
        #   practice["practices"].first["visit_address"]["zip"]
        # @doctors[:phone_numbers] << practice["practices"].first["phones"].first["number"]
        #
        @doctors <<
          [practice["practices"].first["name"],

          practice["practices"].first["visit_address"]["street"] + " " +
          practice["practices"].first["visit_address"]["city"] + ", " +
          practice["practices"].first["visit_address"]["state"] + " " +
          practice["practices"].first["visit_address"]["zip"],

          practice["practices"].first["phones"].first["number"]]
      end
    end

    render :index
  end


end
