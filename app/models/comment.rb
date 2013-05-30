class Comment < ActiveRecord::Base
  attr_accessible :message, :owner_id, :story_id
end
