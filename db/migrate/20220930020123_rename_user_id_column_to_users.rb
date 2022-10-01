class RenameUserIdColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_id, :username
  end
end

#カラム名変更したはずなのにできていない
#やばいかもしれないので帰ったら確認必須