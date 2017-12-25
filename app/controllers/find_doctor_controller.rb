class FindDoctorController < ApplicationController
  before_action :specialties, :states

  def index
    @patient = Patient.find(params[:patient_id])
    @doctors = []
    @specialty = ""
  end

  def doctor_name(practice)
    practice["practices"].first["name"]
  end

  def full_address(practice)
    practice["practices"].first["visit_address"]["street"] + " " +
    practice["practices"].first["visit_address"]["city"] + ", " +
    practice["practices"].first["visit_address"]["state"] + " " +
    practice["practices"].first["visit_address"]["zip"]
  end

  def phone_number(practice)
    practice["practices"].first["phones"].first["number"]
  end

  def create
    @patient = Patient.find(params[:patient_id])
    city = params[:city].strip.downcase
    state = params[:state].strip.downcase
    @specialty = params[:specialty].strip.downcase
    @doctors = []

  #34f9ff67082e6e43cfb2dc335e45decf
    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{@specialty}&location=#{state}-#{city}&limit=20&user_key=34f9ff67082e6e43cfb2dc335e45decf")
    data = JSON.parse(response.body)

    if data["data"]
      @doctors = data["data"].map do |practice|
        [doctor_name(practice), full_address(practice), phone_number(practice)]
      end.uniq
    end
  
    render :index
  end


end
