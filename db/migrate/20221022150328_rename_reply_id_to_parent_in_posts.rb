class RenameReplyIdToParentInPosts < ActiveRecord::Migration[7.0]
  def up
    rename_column :posts, :reply_id, :parent_id
  end

  def down
    rename_column :posts, :parent_id, :reply_id
  end
end
