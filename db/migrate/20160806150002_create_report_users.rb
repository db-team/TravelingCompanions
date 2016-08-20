class CreateReportUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :report_users do |t|
      t.integer :reporter_id
      t.integer :reportee_id
      t.text :reason

      t.timestamps
    end
    add_index :report_users, :reporter_id
    add_index :report_users, :reportee_id
    add_index :report_users, [:reporter_id, :reportee_id], unique: true
  end
end
