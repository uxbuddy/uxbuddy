# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Starting to seed db..."

Rake::Task['load_data:add_questions'].invoke
Rake::Task['load_data:add_test_types'].invoke

Test.create(name: 'Youtube', test_url: "https://www.youtube.com/embed/XGSy3_Czz8k", test_type_id: 1, slug: "youtube", question_ids: [1,2,3])
Test.create(name: 'Asos', test_url: "https://www.asos.com", test_type_id: 1, slug: "asos", question_ids: [1,2,3])
Test.create(name: 'Google', test_url: "https://www.google.com", test_type_id: 1, slug: "google", question_ids: [1,2,3])

Question.all.each do |question|
  question.test_types << TestType.where(id: 1)
end

Test.all.each do |test|
  test.questions.each do |question|
    3.times do
      Answer.create(format: "Range", response: rand(1..5), comment: 'wow', question_id: question.id, test_id: test.id)
    end
  end
end

puts "Finished seeding db"
