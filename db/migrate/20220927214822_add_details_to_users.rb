class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_id, :string
  end
end
