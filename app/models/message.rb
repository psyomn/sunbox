class Message < ActiveRecord::Base
  attr_accessible :contents, :from_user_id, :to_user, :to_user_id
end
