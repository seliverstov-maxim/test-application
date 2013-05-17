class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation 
  has_secure_password 
  validates_presence_of :password, :on => :create

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
