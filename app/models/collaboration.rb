class Collaboration < ActiveRecord::Base
  attr_accessible :description, :owner_id
end
