class ChangePatientUiDtoString < ActiveRecord::Migration[5.1]
  def change
    change_column :patients, :uid, :string
  end
end
