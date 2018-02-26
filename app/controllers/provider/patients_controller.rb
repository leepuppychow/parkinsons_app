class Provider::PatientsController < ApplicationController

  def index
    @patients = current_user.patients.sorted_by_last_name
  end

end
