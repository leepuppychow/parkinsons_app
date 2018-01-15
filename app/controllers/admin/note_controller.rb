class Admin::NoteController < Admin::BaseController

  def index
    @notes = Note.all.order(:noteable_type)
  end

end
