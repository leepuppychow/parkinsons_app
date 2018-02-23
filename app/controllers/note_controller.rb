class NoteController < ApplicationController

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.noteable_type == "Doctor"
      redirect_to patient_doctors_path(current_user)
    else
      redirect_to patient_medications_path(current_user)
    end
  end

  private

    def note_params
      params.require(:note).permit(:contents)
    end

end
