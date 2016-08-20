class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :fromplace
      t.string :toplace
      t.datetime :fromtime
      t.datetime :totime
      t.integer :maxmember
      t.integer :creator_id
      t.decimal :estimatebudget
      t.decimal :deposit
      t.string :transport
      t.text :description

      t.timestamps
    end
  end
end
