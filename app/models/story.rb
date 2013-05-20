class Story < ActiveRecord::Base
  attr_accessible :description, :owner_id, :performer_id, :state, :title
end
