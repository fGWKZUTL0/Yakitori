class RenameNameColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :Posts, :name, :user_name
  end
end
