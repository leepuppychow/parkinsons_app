class Admin::DoctorsController < Admin::BaseController
  def index
    @doctors = Doctor.all
  end 
end
