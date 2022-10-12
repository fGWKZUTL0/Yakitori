class RenameIconPathColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :icon_path, :icon
  end
end
