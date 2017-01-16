# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skills_array = ["Ruby", "Python", "Javascript", "Java", "Jscript", "C", "C++", "C#", "Objective-C", "PHP", "SQL"]
# skills_array = ['{Ruby}', '{Python}', '{Javascript}', '{Java}' '{Jscript}', '{C}', '{C++}', '{C#}', '{Objective-C}', '{PHP}', '{SQL}']

developers_array = Array.new(4) { rand(1...10) }

User.destroy_all
Developer.destroy_all
Project.destroy_all

15.times do
  User.create(email: Faker::Internet.email, password: "Password1234!")
end

10.times do
  Developer.create(name: Faker::App.author, users_id: rand(1..10), skills: skills_array.sample(1 + rand(skills_array.count)) , description: Faker::Lorem.paragraph, motto: Faker::Lorem.sentence)
end

10.times do
  Project.create(title: Faker::App.name, description: Faker::Lorem.paragraph, languages_required: skills_array.sample(1 + rand(skills_array.count)) , user_id: rand(1..15) , developers_id: developers_array )
end
