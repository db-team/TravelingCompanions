class CreateBlogComments < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_comments do |t|
      t.integer :commenter_id, index: true
      t.text :body
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
