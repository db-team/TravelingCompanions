class Tourmember < ApplicationRecord
	validates :tour_id, :member_id, presence: true
	validates_inclusion_of :role, :in => %w( teamlead member)
	validates_inclusion_of :status, :in => %w(pending approved rejected cancelled)
	
	belongs_to :tour
	belongs_to :member, class_name: "User"

	# scope :pending_members, -> {where(status: :pending)}
	# scope :approved_members, -> {where(status: :approved)}
	# scope :cancelled_members, -> {where(status: :cancelled)}

	def approved
		status = :approved
	end

	def reject
		status = :reject
	end

	def pending
		self.status = :pending
		self.save
	end

	def cancel
		self.status = :cancelled
		self.save
	end
end
