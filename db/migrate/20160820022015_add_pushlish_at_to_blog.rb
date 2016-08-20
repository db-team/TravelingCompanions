class AddPushlishAtToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :published_at, :datetime
  end
end
