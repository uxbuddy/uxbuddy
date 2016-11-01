# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Starting to seed db..."

Rake::Task['load_data:add_questions'].invoke
Rake::Task['load_data:add_test_types'].invoke

Question.all.each do |question|
  question.test_types << TestType.where(id: 1)
end

puts "Finished seeding db"
