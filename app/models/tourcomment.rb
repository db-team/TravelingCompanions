class Tourcomment < ApplicationRecord
	belongs_to :tour
	belongs_to :commenter, class_name: "User"

	def commenter_name
		commenter ? commenter.username : "anonymous"
	end

	def commenter_avatar
		commenter ? commenter.get_avatar : User.default_avatar
	end
end
