class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.string :location
      t.integer :years_experience

      t.timestamps
    end
  end
end
