class NoteController < ApplicationController

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)

    if @note.noteable_type == "Doctor" || @note.noteable_type == "Therapist"
      redirect_to patient_therapists_path(current_user)
    else
      redirect_to patient_medications_path(current_user)
    end
# Note: to get the parent of the note (could be doctor, therapist, medication)
# use note.noteable
  end

  private

    def note_params
      params.require(:note).permit(:contents)
    end

end
