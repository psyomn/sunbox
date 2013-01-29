class StaticPageController < ApplicationController
  def home
    @users = User.find(:all, :limit => 10, :order => "created_at desc")
    @songs = Song.find(:all, :limit => 10, :order => "created_at desc")
    @news_item = Newspaper.last

    @news_item = Newspaper.new(:title => "No News"\
    , :text => "No news is good news. More to come soon.") if @news_item.nil?
  end

  def about
  end

  def contact
  end
end
