class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.integer :status, default: 0
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
    end
  end
end
