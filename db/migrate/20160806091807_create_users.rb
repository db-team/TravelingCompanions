class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.date :dob
      t.boolean :gender
      t.string :avatar_url
      t.string :address
      t.boolean :is_active

      t.timestamps
    end
  end
end
