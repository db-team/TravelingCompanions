class RemovePublishFromBlog < ActiveRecord::Migration[5.0]
  def change
    remove_column :blogs, :published, :boolean
    remove_column :blogs, :published_at, :datetime
  end
end
