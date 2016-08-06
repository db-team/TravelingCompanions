class Tourmember < ApplicationRecord
	belongs_to :tour
	belongs_to :member, class_name: "User"
end
