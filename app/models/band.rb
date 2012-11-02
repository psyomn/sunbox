class Band < ActiveRecord::Base
  attr_accessible :description, :name

  # Validations
  validates :name, :presence => true

  # Relations
  has_many :songs 
end
