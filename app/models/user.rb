class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation 
  has_secure_password 
  validates_presence_of :password, :on => :create

  has_many :stories, dependent: :nullify, foreign_key: "owner_id"
  has_many :stories, dependent: :nullify, foreign_key: "performer_id"
end
