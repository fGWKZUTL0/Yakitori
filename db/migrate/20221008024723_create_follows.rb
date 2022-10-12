class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.string :follow_id

      t.timestamps
    end
  end
end
