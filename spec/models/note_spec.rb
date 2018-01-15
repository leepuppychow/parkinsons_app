require 'rails_helper'

RSpec.describe Note, type: :model do

  describe "Relationships" do
    it {should respond_to(:noteable)}
  end

end
