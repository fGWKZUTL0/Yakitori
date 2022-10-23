class AddReplyIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reply_id, :integer
  end
end
