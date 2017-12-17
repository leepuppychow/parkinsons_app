class RenameTherapistColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :therapists, :type, :therapy_type
  end
end
