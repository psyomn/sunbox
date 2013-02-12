class Collaboration < ActiveRecord::Base
  attr_accessible :description, :owner_id

  # Validations 
  validates :owner_id, :presence => true 
  validates_length_of :description, :minimum => 10

end
