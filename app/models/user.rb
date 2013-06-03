class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation 
  has_secure_password 

  validates :password_digest, presence: true

  has_many :owner_stories, dependent: :destroy, class_name: "Story", foreign_key: "owner_id"
  has_many :owner_comments, dependent: :destroy, class_name: "Comment", foreign_key: "owner_id"
  has_many :perfomer_stories, dependent: :nullify, class_name: "Story", foreign_key: "performer_id"
end
