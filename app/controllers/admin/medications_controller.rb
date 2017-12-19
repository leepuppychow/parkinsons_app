class Admin::MedicationsController < Admin::BaseController

  def index
    @medications = Medication.all 
  end

end
