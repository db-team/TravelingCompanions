class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :extended_html_content
      t.integer :author_id

      t.timestamps
    end
  end
end
