class AddTimestampsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:messages, null: false)
  end
end
