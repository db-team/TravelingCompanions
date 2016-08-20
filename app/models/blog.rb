class Blog < ApplicationRecord
	include Bootsy::Container
	belongs_to :author, class_name: 'User'
	validates :extended_html_content, :photo_url, presence: true
	acts_as_taggable

	scope :published, -> { where(published: true) }

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
