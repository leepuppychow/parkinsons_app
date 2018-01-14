class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :contents
      t.references :noteable, polymorphic: true

      t.timestamps
    end
  end
end
