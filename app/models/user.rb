class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: {case_insensitive: false}
  has_many :active_relationships, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :rates, class_name: "Creditrating", foreign_key: "rater_id"
  has_many :ratings, class_name: "Creditrating", foreign_key: "ratee_id"
  has_many :reportothers, class_name: "Reportuser", foreign_key: "reporter_id"
  has_many :reported, class_name: "Reportuser", foreign_key: "reportee_id"

  has_secure_password
end
