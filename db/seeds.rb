# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#<% 1000.times do |n| %>
#user_<%= n %>:
#  username: <%= "user#{n}" %>
#  email: <%= "user#{n}@example.com" %>
#<% end %>
User.create(email: "admin@edify.online", password: "educatus", password_confirmation: "educatus")
