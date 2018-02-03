class FindDoctorController < ApplicationController
  before_action :specialties, :states, :current_user

  def index
    @doctors = Hash.new()
    @specialty = ""
    @city = ""
    @state = ""
  end

  def create
    @city = city_formatted(params[:city])
    @state = params[:state].strip.downcase
    @specialty = params[:specialty].strip.downcase
    @doctors = Hash.new()

    response = Faraday.get("https://api.betterdoctor.com/2016-03-01/doctors?specialty_uid=#{@specialty}&location=#{@state}-#{@city}&limit=20&user_key=#{ENV["BETTER_DOCTOR_KEY"]}")
    data = JSON.parse(response.body)

    if data["data"]
      data["data"].each do |practice|
        @doctors["#{doctor_name(practice)}"] = {
          :specialty => @specialty,
          :location => full_address(practice),
          :phone_number => phone_number(practice),
          :insurance => insurances_accepted(practice)
        }
      end
    end

    render :index
  end

  private

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

    def insurances_accepted(practice)
      practice["practices"].first["insurance_uids"]
    end

    def city_formatted(city)
      city.strip.downcase.tr(" ", "-")
    end
end
