class FindDoctorController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
  end

  def create
    city = params[:city]
    state = params[:state]
    specialty = params[:specialty]
    gender = params[:gender]
    first_name = params[:first_name]
    last_name = params[:last_name]
#34f9ff67082e6e43cfb2dc335e45decf 
  end


end
