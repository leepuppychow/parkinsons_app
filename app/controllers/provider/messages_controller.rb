class Provider::MessagesController < ApplicationController

  def new
    @patient = current_user.patients.find(params[:patient].to_i)
    @message = Message.new
  end

  def create
    @patient = current_user.patients.find(params[:message][:patient].to_i)
    @message = current_user.messages.new(message_params)
    @message.patient = @patient
    if @message.save
      flash[:notice] = "Message was sent successfully!"
      redirect_to doctor_patients_path(current_user)
    else
      flash[:notice] = "Sorry, message did not send properly. Please try again."
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:title, :content)
    end
end
