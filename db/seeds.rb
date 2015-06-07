# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

interests = Faker::Lorem.words(20).map {|name| Interest.where({name: name}).first_or_create}
skills = Faker::Lorem.words(20).map {|name| Skill.where({name: name}).first_or_create}
professions = Faker::Lorem.words(20).map {|name| Profession.where({name: name}).first_or_create}

50.times do
  User.create!({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    interests: interests.sample(3),
    skills: skills.sample(2),
    professions: professions.sample(1),
  })
end

nonprofits = (1..20).map { NonProfit.create!({name: Faker::Company.name}) }

100.times do
  start_time = Faker::Time.between(1.month.ago, 1.month.from_now, :day)
  Event.create!({
    title: Faker::Lorem.sentence(3, true, 6),
    description: Faker::Lorem.paragraph(3, true, 3),
    start_time: start_time,
    end_time: Faker::Time.between(start_time, start_time + 5.hours),
    non_profit: nonprofits.sample,
    # location: Faker::Address.street_address,
  })
end

500.times do
  user = User.all.sample
  event = Event.all.sample
  user.events << event unless user.events.include? event
end
