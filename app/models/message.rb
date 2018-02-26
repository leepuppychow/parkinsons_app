class Message < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: ["unread", "read"]

  def new_message?
    return true if self.status == "unread"
  end

end
