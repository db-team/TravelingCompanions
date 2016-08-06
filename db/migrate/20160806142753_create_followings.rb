class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
    add_index :followings, :follower_id
    add_index :followings, :followee_id
    add_index :followings, [:follower_id, :followee_id], unique: true
  end
end
