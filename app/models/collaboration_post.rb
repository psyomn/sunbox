class CollaborationPost < ActiveRecord::Base
  attr_accessible :author_id, :collaboration_id, :message
end
