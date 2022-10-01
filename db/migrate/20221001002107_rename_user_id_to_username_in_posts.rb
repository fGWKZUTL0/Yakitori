class RenameUserIdToUsernameInPosts < ActiveRecord::Migration[7.0]
  def up
    rename_column :posts, :user_id, :username
  end
  def down
    rename_column :posts, :username, :user_id
  end
end
