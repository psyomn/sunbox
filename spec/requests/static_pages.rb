require 'spec_helper'

# Test all the static pages.

describe "Static pages" do 
  describe "Home" do
    it "should have the content" do 
      visit '/home'
      page.should have_content('Sunbox')
    end 
  end

  describe "About" do 
    it "should have the contents of the about page" do
      visit '/about'
      page.should have_content('Sunbox hopes to be a platform for people to share, learn and collaborate on sunvox songs.')
    end 
  end

  describe "Contact" do
    it "should state opensource-ness and location to get source" do 
      visit '/contact'
      page.should have_content('github.com/psyomn/sunbox.git')
    end 
  end 
end 
