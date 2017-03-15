# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
Subject.delete_all
Course.delete_all
Instructor.delete_all

json = ActiveSupport::JSON.decode(File.read('db/subject.json'))
json.each do |item|
  Subject.create(:abbreviation => item['abbreviation'], :name => item['name'])
end

json = ActiveSupport::JSON.decode(File.read('db/course.json'))
json.each do |item|
  Course.create(:code => item['code'], :name => item['name'], :description => item['description'],
  :credits => item['credits'].to_i, :independent_study => item['independent_study'], :requirements => item['requirements'])
end

json = ActiveSupport::JSON.decode(File.read('db/instructor.json'))
json.each do |item|
  Instructor.create(:first => item['first'], :middle => item['middle'], :last => item['last'], :email => item['email'])
end
