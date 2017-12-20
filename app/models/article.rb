class Article < ApplicationRecord
  validates :title, :content, :address, presence: true 

end
