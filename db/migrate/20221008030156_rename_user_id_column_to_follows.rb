class RenameUserIdColumnToFollows < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :user_id, :follower_id #フォローした人
    rename_column :follows, :follow_id, :followed_id #フォローされた人
  end
end
