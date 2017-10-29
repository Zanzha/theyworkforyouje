# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

parish_list = Array["Saint Helier","Grouville","Saint Brelade","Saint Clement","Saint John","Saint Lawrence","Saint Martin","Saint Mary","Saint Ouen","Saint Peter","Saint Saviour","Trinity"]

parish_list.each do |parish|
  Parish.create(name: parish)
end

Role.create(name: 'Admin', created_at: '201710240000', updated_at: '201710240000')
Role.create(name: 'Guest', created_at: '201710240000', updated_at: '201710240000')
User.create(username: 'Captain Placeholder', email: 'admin@admin.com', password: 'topsecret', password_confirmation: 'topsecret', created_by: 'devteam', role_id: '1', created_at: '201710240000', updated_at: '201710240000')