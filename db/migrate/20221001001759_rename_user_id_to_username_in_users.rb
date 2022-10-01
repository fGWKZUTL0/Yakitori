class RenameUserIdToUsernameInUsers < ActiveRecord::Migration[7.0]
  def up
    rename_column :users, :user_id, :username
  end
  def down
    rename_column :users, :username, :user_id
  end
end
