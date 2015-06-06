# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

peter, katie = User.create!([
  { name: "Peter", email: "peter@example.com", password: "password" },
  { name: "Katie", email: "katie@example.com", password: "password2" },
  ])

peter.skills.create! ([
  { name: "Ruby on Rails" },
  ])
