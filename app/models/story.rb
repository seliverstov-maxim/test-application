class Story < ActiveRecord::Base
  attr_accessible :description, :title#, :owner_id, :performer_id, :state

  belongs_to :owner, class_name: "User"
  belongs_to :performer, class_name: "User"
end
