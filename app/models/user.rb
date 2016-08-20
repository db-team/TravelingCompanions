class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: {case_insensitive: false}
  has_many :active_relationships, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :rates, class_name: "Creditrating", foreign_key: "rater_id"
  has_many :ratings, class_name: "Creditrating", foreign_key: "ratee_id"
  has_many :reportothers, class_name: "Reportuser", foreign_key: "reporter_id"
  has_many :reported, class_name: "Reportuser", foreign_key: "reportee_id"
  has_many :tourratings
  has_many :tours, class_name: 'Tour', :foreign_key => "creator"

  has_secure_password

  def get_avatar
  	if avatar_url 
  		avatar_url
  	else
  		# Unknown avatar
  		'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBSGEU8ALTcThDrHBnbKimaGg_iYTz-M2uQedFhGXgHpMrRiP47e8GWm0'
  	end
  end

  def my_tour

  end
end
