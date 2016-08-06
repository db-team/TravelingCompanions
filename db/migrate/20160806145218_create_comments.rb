class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :blog_id
      t.integer :commenter_id
      t.text :content
      t.string :status

      t.timestamps
    end
    add_index :comments, :blog_id
    add_index :comments, :commenter_id
    add_index :comments, [:commenter_id, :blog_id], unique: true
  end
end
