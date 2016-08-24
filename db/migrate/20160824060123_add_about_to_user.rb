class AddAboutToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :about, :string
    add_column :users, :job, :string
  end
end
