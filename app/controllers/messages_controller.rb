class MessagesController < ApplicationController

  def new
    @doctor = current_user.doctors.find(params[:doctor].to_i)
    @message = Message.new
    @message_history = Message.conversation(current_user, @doctor)
  end

  def create
    @doctor = current_user.doctors.find(params[:message][:doctor].to_i)
    @message = current_user.messages.new(message_params)
    @message.doctor = @doctor
    if @message.save
      flash[:notice] = "Message was sent successfully!"
      redirect_to patient_doctors_path(current_user)
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
