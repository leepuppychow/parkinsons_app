class Appointment < ApplicationRecord
  belongs_to :appointable, polymorphic: true 


end
