# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
5.times do |n|
  email = "test-#{ n+1 }@test.org"
  password = "password"
  User.create!(email: email, password: password, password_confirmation: password)
end

users = User.order(:created_at).take(5)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.suggestion.create!(content: content) }
end
