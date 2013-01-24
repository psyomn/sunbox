require 'spec_helper'

describe "Static pages" do 
  describe "Home" do
    it "should have the content" do 
      visit '/home'
      page.should have_content('Sunbox')
    end 
  end
end 
