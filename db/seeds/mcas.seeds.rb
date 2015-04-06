require 'csv'

Student.destroy_all
Assessment.where(name: "MCAS").destroy_all

path = "#{Rails.root}/data/mcas.csv"
healey = School.find_by_name("Arthur D Healey")
grade = "05"
year = Time.new(2014)
importer = McasImporter.new(path, healey, grade, year).import

puts "#{Student.all.size} students."
puts "#{Assessment.all.size} assessments."
puts "#{StudentResult.all.size} student results."
puts "#{Student.where(limited_english_proficient: true).size} limited English proficient."
puts "#{Student.where(former_limited_english_proficient: true).size} formerly limited English proficient."