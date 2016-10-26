require 'csv'

namespace :load_data do

  task :add_questions do
    csv_text = File.read('lib/assets/questions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Question.create!(row.to_hash)
    end
  end

  task :add_test_types do
    csv_text = File.read('lib/assets/test_types.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      TestType.create!(row.to_hash)
    end
  end

end
