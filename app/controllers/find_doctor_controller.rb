class FindDoctorController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
    @doctors = []
  end

  def create
    @patient = Patient.find(params[:patient_id])
    city = params[:city].strip.downcase
    state = params[:state].strip.downcase
    specialty = params[:specialty].strip.downcase
    gender = params[:gender].strip.downcase
    first_name = params[:first_name].strip.downcase
    last_name = params[:last_name].strip.downcase

  #34f9ff67082e6e43cfb2dc335e45decf
    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?first_name=#{first_name}&last_name=#{last_name}&gender=#{gender}&specialty_uid=#{specialty}&location=#{state}-#{city}&user_key=34f9ff67082e6e43cfb2dc335e45decf")
    data = JSON.parse(response.body)

    # @doctors = {
    #   names: [],
    #   addresses: [],
    #   phone_numbers: []
    # }

    @doctors = []

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

    render :index
  end


end
