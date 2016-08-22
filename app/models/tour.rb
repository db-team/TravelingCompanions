class Tour < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :tourmembers, :dependent =>  :destroy
	has_many :pending_members, -> { where(:status => 'pending').includes(:member)}, class_name: "Tourmember"
	has_many :approved_members, -> { where(:status => 'approved')}, class_name: :Tourmember
	has_many :cancelled_members, -> { where(:status => 'cancelled')}, class_name: :Tourmember
	has_many :members, through: :tourmembers, :dependent =>  :destroy

	has_many :tourimages, :dependent => :destroy
	has_many :tourcomments, :dependent =>  :destroy

	has_many :tourratings, :dependent =>  :destroy

	acts_as_taggable 
	
	scope :active, -> {where('fromtime > ? ', DateTime.now)}
	scope :inactive, -> {where('fromtime <= ? ', DateTime.now)}
	scope :red, -> { where(color: 'red') }
	scope :of_user, -> (user) { where(creator: user)}
	scope :upcoming, -> {where('fromtime >= :three_days', :three_days => Time.zone.now + 3.days)}

	def self.transport_list
		["Xe may", "Tau lua", "May bay", "Xe khach"]
	end

	def short_description
		description[0..100] + ' ... '
	end

	def created_by?(user_id)
		return creator.id == user_id
	end

	def created_by_me?
		created_by?(current_user.id)
	end

	def enough_members?
		return total_approved_members >= maxmember
	end

	def total_pending_members
		pending_members.count
	end

	def total_approved_members
		approved_members.count
	end

	def sorted_members
		h = {1=>"pending", 2=>"approved", 3=>"rejected", 4=>"cancelled"}
		tourmembers.sort_by do |m| h.key(m.status) 
		end
	end
	def find_member(user)
		tourmembers.find_by(member_id: user.id)
	end

	def join_request(user_id)
		m = find_member(user_id)
		unless m
			Tourmember.create!(:tour => self, :member => user_id, :role => 'member', :status => 'pending')
		else
			m.pending		
		end
	end

	def pick_member(user_id)
		tourmembers.where(:member_id => user_id).first.approved
	end

	def reject_member(user_id)
		tourmembers.where(:member_id => user_id).first.rejected
	end

	def cancel_request(user_id)
		tourmembers.where(:member_id => user_id).first.cancelled
	end

	def all_member_names
		tourmembers.map{|m| m.member.username}.to_sentence
	end

	def pending_member_names
		pending_members.map{|m| m.member.username}.to_sentence
	end

	def approved_member_names
		approved_members.map{|m| m.member.username}.to_sentence
	end

	def has_pending_request(user)		
		return pending_members.find_by(:id => user.id) if user
	end

	def has_request_from?(user)
		return true if user && members.find_by(:id => user.id) 
	end

	# def pending_members
	# 	members.merge(Tourmember.pending_members)
	# end

	def travel_time
		fromtime.to_s + " - " + totime.to_s

	end

	def travel_route
		fromplace + " - " + toplace
	end

	def pick_image
		if tourimages.first 
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
