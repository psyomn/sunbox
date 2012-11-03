class StaticPageController < ApplicationController
  def home
    @users = User.find(:all, :limit => 10, :order => "created_at desc")
    @songs = Song.find(:all, :limit => 10, :order => "created_at desc")
    @news_item = Newspaper.first

    @news_item = Newspaper.new(:title => "template"\
    , :text => "there should be something else here") if @news_item.nil?

  end

  def about
  end

  def contact
  end
end
