class Admin::TherapistsController < Admin::BaseController

  def index
    @therapists = Therapist.all 
  end

end
