# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting to seed db..."


Rake::Task['load_data:add_questions'].invoke
Rake::Task['load_data:add_test_types'].invoke

Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k", test_type_id: 1)
Test.create(name: 'Asos', test_url: "https://www.asos.com", test_type_id: 1)
Test.create(name: 'Google', test_url: "https://www.google.com", test_type_id: 1)

5.times do
  Answer.create(format: "Range", response: 4, question_id: 1)
end

puts "Finished seeding db"
