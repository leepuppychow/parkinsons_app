class Api::V1::DoctorsController < ApiController

  def index
    render json: Doctor.where("name LIKE ?", "%#{params[:name]}%")
  end

end
