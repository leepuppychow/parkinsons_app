class AddColumnsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :uid, :integer
    add_column :patients, :token, :string
  end
end
