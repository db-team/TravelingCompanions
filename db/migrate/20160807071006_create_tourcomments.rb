class CreateTourcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :tourcomments do |t|
      t.integer :tour_id
      t.integer :commenter_id
      t.text :content
      t.string :status

      t.timestamps
    end
    add_index :tourcomments, :tour_id
    add_index :tourcomments, :commenter_id
    
  end
end
