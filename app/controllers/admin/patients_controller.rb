class Admin::PatientsController < ApplicationController

  def index
    @patients = Patient.all 
  end

end
