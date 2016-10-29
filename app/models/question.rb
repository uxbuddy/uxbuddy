class Question < ApplicationRecord
  has_many :answers
  has_and_belongs_to_many :test_types
  has_and_belongs_to_many :tests, join_table: "tests_questions"

  def ave_response(test_id)
    (self.answers.where(test_id: test_id)).average(:response)
  end

end
