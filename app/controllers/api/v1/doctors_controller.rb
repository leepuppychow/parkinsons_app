class Api::V1::DoctorsController < ApiController

  def index
    render json: Doctor.where("name LIKE ? OR specialty LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
  end

end
