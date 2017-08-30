# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Youtube.delete_all
# ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'youtube'")

Trending.delete_all
# ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'trending'")

