class Creditrating < ApplicationRecord
	belongs_to :rater, class_name: "User"
	belongs_to :ratee, class_name: "User"
end
