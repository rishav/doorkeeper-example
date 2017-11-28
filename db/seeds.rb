# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'admin@test.org', password: "123123", password_confirmation: "123123")

5.times do |n|
  Post.create!(title: "title #{n}", body: "Random body", user: user)
end
