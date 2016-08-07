class Tourcomment < ApplicationRecord
	belongs_to :tour
	belongs_to :commenter, class_name: "User"
end
