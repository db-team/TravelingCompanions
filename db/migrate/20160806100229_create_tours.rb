class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :fromplace
      t.string :toplace
      t.date :fromtime
      t.date :totime
      t.integer :maxmember
      t.string :creator
      t.decimal :estimatebudget
      t.decimal :deposit
      t.string :transport
      t.text :description

      t.timestamps
    end
  end
end
