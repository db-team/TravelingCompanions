class Tour < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :tourmembers
	has_many :members, through: :tourmembers, :dependent =>  :destroy

	has_many :tourimages, :dependent => :destroy
	has_many :tourcomments  

	has_many :tourratings

	acts_as_taggable 
	
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

	def pick_image
		if tourimages.first.img_url 
			tourimages.first.img_url 
		else
			'http://vignette4.wikia.nocookie.net/aliceinwonderland/images/9/95/Wo.jpg/revision/latest?cb=20160106000058'
		end
	end

	def rated_up_by(user)
		if user.id != creator.id
			tourratings << Tourrating.create!(:tour => self, :user => user, :point => 1)
		end
	end

	def rated_down_by(user)
		if user.id != creator.id
			tourratings << Tourrating.create!(:tour => self, :user => user, :point => -1)
		end
	end

	def total_rate_up
		tourratings.where('point > 0').count
	end

	def total_rate_down
		tourratings.where('point < 0').count
	end
	# def approve_member
	# 	tourmembers.where(status: 'approved')
	# end


end
