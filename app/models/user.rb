class User < ActiveRecord::Base
  attr_accessible :email, :password

  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :email, :on => :create
end
