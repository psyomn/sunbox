# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create sample users
sample_users = User.create([
  {
    :name => 'John',
    :email => 'john@john.com',
    :password => 'testtest',
    :password_confirmation => 'testtest',
    :bio => "I am john."
  },
  {
    :name => 'Helen',
    :password => 'testtest',
    :email => 'helen@helen.com',
    :password_confirmation => 'testtest', 
    :bio => "I am Helen. I like doing this and that. I like that because of this. I like this because of that. I like ponies. And turtles. I think. I don't know"
  }

])

# Create sample news
sample_news = Newspaper.create([
  {
    :title => "The title of first",
    :text  => "This is the derp derp text derp herp derp text."
  }, 
  {
    :title => "My fist in your face", 
    :text => "This is where I kick you in the face with my fist." 
  }
])
