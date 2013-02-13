class CollaborationPost < ActiveRecord::Base
  attr_accessible :author_id, :collaboration_id, :message

  belongs_to :collaboration
  belongs_to :author, :foreign_key => :author_id, :class_name => "User"
end
