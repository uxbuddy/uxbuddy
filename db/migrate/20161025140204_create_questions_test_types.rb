class CreateQuestionsTestTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_test_types do |t|
      t.references :test_type, foreign_key: true
      t.references :question, foreign_key: true
    end
  end
end
