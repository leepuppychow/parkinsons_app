class Patient < ApplicationRecord
  validates_presence_of :first_name, :last_name, :age
  validates :email, :password, presence: true, uniqueness: true
  belongs_to :doctor, optional: true #in case patient doesn't have doctor

end
