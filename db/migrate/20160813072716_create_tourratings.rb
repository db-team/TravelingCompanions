class CreateTourratings < ActiveRecord::Migration[5.0]
  def change
    create_table :tourratings do |t|
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :point

      t.timestamps
    end
  end
end
