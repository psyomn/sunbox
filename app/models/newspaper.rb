class Newspaper < ActiveRecord::Base
  attr_accessible :text, :title

  # Validations
  validates :text, :presence => true
  validates :title, :presence => true

  # Small helper in order to convert the universal newline
  # to a breakline
  def text_to_html
    self.text.gsub("\r\n","<br/>")
  end 
end
