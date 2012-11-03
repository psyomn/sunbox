class Newspaper < ActiveRecord::Base
  attr_accessible :text, :title

  # Validations
  validates :text, :presence => true
  validates :title, :presence => true

end
