class Blog < ApplicationRecord
	include Bootsy::Container
	belongs_to :author, class_name: 'User'
	validates :extended_html_content, :title, presence: true
	acts_as_taggable
end
