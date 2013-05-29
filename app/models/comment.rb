class Comment < ActiveRecord::Base
  attr_accessible :message, :owner_id, :task_id
end
