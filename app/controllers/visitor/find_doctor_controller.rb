require './app/authentication_keys'

class Visitor::FindDoctorController < ApplicationController
  include AuthenticationKeys
  before_action :specialties, :states

  def index
    @doctors = []
    @specialty = ""
    @city = ""
    @state = ""
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

  def city_formatted(city)
    city.strip.downcase.tr(" ", "-")
  end

  def create
    @city = city_formatted(params[:city])
    @state = params[:state].strip.downcase
    @specialty = params[:specialty].strip.downcase
    @doctors = []

    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{@specialty}&location=#{@state}-#{@city}&limit=20&user_key=#{BETTER_DOCTOR_KEY}")
    data = JSON.parse(response.body)

    if data["data"]
      @doctors = data["data"].map do |practice|
        [doctor_name(practice), full_address(practice), phone_number(practice)]
      end.uniq
    end

    render :index
  end

end
