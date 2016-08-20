class AddMainPhotoToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :photo_url, :string
  end
end
