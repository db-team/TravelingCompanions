class AddPublishToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :published, :boolean, :default => false
  end
end
