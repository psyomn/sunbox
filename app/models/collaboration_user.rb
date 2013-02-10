class CollaborationUser < ActiveRecord::Base
  attr_accessible :collaboration_id, :user_id
end
