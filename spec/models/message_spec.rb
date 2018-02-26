require 'rails_helper'

describe Message do
  context "Relationships" do
    it {is_expected.to belong_to(:doctor)}
    it {is_expected.to belong_to(:patient)}
  end

  context "Instance Methods" do
    it "#new_message?" do
      message = create(:message, status: 0)
      expect(message.new_message?).to eq true
    end
  end
end
