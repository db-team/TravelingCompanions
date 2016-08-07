class Tour < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :tourmembers
	has_many :members, through: :tourmembers, :dependent =>  :destroy

	has_many :tourcomments
	
	scope :active, -> {where('fromtime > ? ', DateTime.now)}
	scope :inactive, -> {where('fromtime <= ? ', DateTime.now)}

	scope :red, -> { where(color: 'red') }

	def self.transport_list
		["Xe may", "Tau lua", "May bay", "Xe khach"]
	end

	def pending_members
		members.merge(Tourmember.pending_members)
	end

	def travel_time
		fromtime.to_s + " - " + totime.to_s

	end

	def travel_route
		fromplace + " - " + toplace
	end

	# def approve_member
	# 	tourmembers.where(status: 'approved')
	# end


end
