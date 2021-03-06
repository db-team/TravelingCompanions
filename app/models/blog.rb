class Blog < ApplicationRecord
	include Bootsy::Container
	belongs_to :author, class_name: 'User'
	validates :extended_html_content, :photo_url, presence: true
	acts_as_taggable
	mount_uploader :photo_url, ImageUploader
	has_many :blog_comments
	scope :excluding, -> (*values) { 
  where(
    "#{table_name}.id NOT IN (?)",
      (
        values.compact.flatten.map { |e|
          if e.is_a?(Integer) 
            e
          else
            e.is_a?(self) ? e.id : raise("Element not the same type as #{self}.")
          end
        } << 0
      )
    )
  }

	def self.lastest_blog
		order('created_at desc')
	end

	def published(blog)
		blog.update_attribute(:published, 1)
	end

	def unpublish(blog)
		blog.update_attribute(:published, 0)
	end

end
