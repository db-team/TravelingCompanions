class CreateTourmembers < ActiveRecord::Migration[5.0]
  def change
    create_table :tourmembers do |t|
      t.integer :tour_id
      t.integer :member_id
      t.string :role
      t.string :status

      t.timestamps
    end
    add_index :tourmembers, :tour_id
    add_index :tourmembers, :member_id
    add_index :tourmembers, [:member_id, :tour_id], unique: true
  end
end
