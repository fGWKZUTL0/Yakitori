class RenameImagePathColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :image_path, :icon_path
  end
end
