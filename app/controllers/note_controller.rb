class NoteController < ApplicationController

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to patient_therapists_path(current_user)
# note that to get the parent of the note (could be doctor, therapist, medication)
# do note.noteable
  end

  private

    def note_params
      params.require(:note).permit(:contents)
    end

end
