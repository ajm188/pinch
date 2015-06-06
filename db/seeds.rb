# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

peter, katie, andrew, tyler, kyle = User.create!([
  { name: "Peter" },
  { name: "Katie" },
  { name: "Andrew" },
  { name: "Tyler" },
  { name: "Kyle" },
  ])

peter.professions.create! name: "Web Development"
