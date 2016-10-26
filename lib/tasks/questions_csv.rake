require 'csv'

namespace :questions_csv do
  task :add_questions do
    csv_text = File.read('lib/assets/questions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Question.create!(row.to_hash)
    end
  end
end
