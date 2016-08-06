class CreateCreditratings < ActiveRecord::Migration[5.0]
  def change
    create_table :creditratings do |t|
      t.integer :rater_id
      t.integer :ratee_id
      t.integer :leadership
      t.integer :teamwork
      t.integer :blogger

      t.timestamps
    end
    add_index :creditratings, :rater_id
    add_index :creditratings, :ratee_id
    add_index :creditratings, [:rater_id, :ratee_id], unique: true
  end
end
