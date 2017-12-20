class AddDescriptionToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :description, :text
  end
end
