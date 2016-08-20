class ReportUser < ApplicationRecord
	belongs_to :reporter, class_name: "User"
	belongs_to :reportee, class_name: "User"
end
