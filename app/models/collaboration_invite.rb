class CollaborationInvite < ActiveRecord::Base
  attr_accessible :collaboration_id, :invitee_id, :message, :owner_id
end
