class Story < ActiveRecord::Base
  attr_accessible :description, :title#, :owner_id, :performer_id, :state

  belongs_to :user
end
