class Collaboration < ActiveRecord::Base
  attr_accessible :description, :owner_id

  belongs_to :owner, :foreign_key => :owner_id, :class_name => "User"
  has_many :posts, :through => :collaboration_posts

  # Validations 
  validates :owner_id, :presence => true 
  validates_length_of :description, :minimum => 10

end
