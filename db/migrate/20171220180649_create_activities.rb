class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :duration
      t.date :date_performed

      t.timestamps 
    end
  end
end
