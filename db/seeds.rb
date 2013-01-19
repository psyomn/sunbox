# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_users = User.create([
  {
    :name => 'John',
    :email => 'john@john.com',
    :password => 'testtest',
    :password_confirmation => 'testtest' 
  },
  {
    :name => 'Helen',
    :password => 'testtest',
    :email => 'helen@helen.com',
    :password_confirmation => 'testtest'
  }

])
