class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name

  # Validations
  validates :email, :presence => true
  validates :name, :presence => true 

end
