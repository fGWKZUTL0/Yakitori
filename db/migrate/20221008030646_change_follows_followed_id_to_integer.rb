class ChangeFollowsFollowedIdToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :follows, :followed_id, :integer, using: "followed_id::integer"
  end
end
