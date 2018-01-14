class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :location
      t.string :phone
      t.string :insurance

      t.timestamps
    end
  end
end
