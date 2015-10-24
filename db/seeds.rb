# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Following relationships

users = User.all
user  = users.first
accepted = users[2..50]
requester = users[3..40]
accepted.each { |accepted| user.accept(accepted) }
requesters.each { |requester| requester.accept(user) }