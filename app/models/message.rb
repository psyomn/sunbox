class Message < ActiveRecord::Base
  attr_accessible :contents, 
    :from_user_id, 
    :to_user, 
    :to_user_id, 
    :subject

  belongs_to :from_user, :foreign_key => :from_user_id, :class_name => "User"
  belongs_to :to_user, :foreign_key => :to_user_id, :class_name => "User"

end
