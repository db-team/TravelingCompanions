class CreateTourimages < ActiveRecord::Migration[5.0]
  def change
    create_table :tourimages do |t|
      t.references :tour, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
