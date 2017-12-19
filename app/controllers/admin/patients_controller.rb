class Admin::PatientsController < Admin::BaseController

  def index
    @patients = Patient.all
  end

end
