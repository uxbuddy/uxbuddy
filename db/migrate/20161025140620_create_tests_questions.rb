class CreateTestsQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :tests_questions do |t|
      t.references :question, foreign_key: true
      t.references :test, foreign_key: true
    end
  end
end
