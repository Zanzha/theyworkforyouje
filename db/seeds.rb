# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


parish_list = Array["Saint Helier","Grouville","Saint Brelade","Saint Clement","Saint John","Saint Lawrence","Saint Martin","Saint Mary","Saint Ouen","Saint Peter","Saint Saviour","Trinity"]

ActiveRecord::Base.connection.execute("TRUNCATE parishes")

parish_list.each do |parish|
  Parish.create(name: parish)
end
