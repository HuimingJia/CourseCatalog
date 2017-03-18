# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'json'
# json = ActiveSupport::JSON.decode(File.read('db/course.json'))
# json.each do |item|
#   @course = Course.create(:code => item['code'], :name => item['name'], :description => item['description'],:independent_study => item['independent_study'])
#   @course.saverail
#   subjects_json = item['subjects']
#   subjects_json.each do |subject|
#     Relationship.create(:course_id => @course.id,:subjectidentifier => subject['id'])
#   end
# end
Subject.delete_all
Course.delete_all
Instructor.delete_all
Relationship.delete_all
Enrollment.delete_all
User.delete_all

json = ActiveSupport::JSON.decode(File.read('db/subject.json'))
json.each do |item|
  Subject.create(:identifier => item['id'],:abbreviation => item['abbreviation'], :name => item['name'])
end

json = ActiveSupport::JSON.decode(File.read('db/course.json'))
json.each do |item|
  @course = Course.create(:code => item['code'], :name => item['name'], :description => item['description'],:independent_study => item['independent_study'])
  subjects_json = item['subjects']
  subjects_json.each do |subject|
      @relationship = Relationship.create(:course_id => @course.id,:subjectidentifier => subject['id'])
      puts @relationship.course_id
      puts @relationship.subjectidentifier
      puts @relationship.valid?
  end
end

json = ActiveSupport::JSON.decode(File.read('db/instructor.json'))
json.each do |item|
  Instructor.create(:identifier => item['id'], :first => item['first'], :middle => item['middle'], :last => item['last'], :email => item['email'])
end
