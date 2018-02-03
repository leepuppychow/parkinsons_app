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
    @doctors = DoctorDataService.new(@city, @state, @specialty).practices
    render :index
  end

  private
  
    def city_formatted(city)
      city.strip.downcase.tr(" ", "-")
    end
end
