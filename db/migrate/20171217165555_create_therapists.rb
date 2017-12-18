class CreateTherapists < ActiveRecord::Migration[5.1]
  def change
    create_table :therapists do |t|
      t.string :first_name
      t.string :last_name
      t.string :type
      t.integer :years_experience

      t.timestamps
    end
  end
end
