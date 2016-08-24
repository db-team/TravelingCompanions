class BlogComment < ApplicationRecord
  belongs_to :blog
  belongs_to :commenter, class_name: 'User'
end
