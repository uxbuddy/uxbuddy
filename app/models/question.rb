class Question < ApplicationRecord
  has_many :answers
  has_and_belongs_to_many :test_types
  has_and_belongs_to_many :tests, join_table: "tests_questions"

  def ave_response(test_id)
    return "Unanswered" if self.answers.where(test_id: test_id).count == 0
    (self.answers.where(test_id: test_id)).average(:response).round(1)
  end

  def comments(test_id)
    answers = self.answers.where(test_id: test_id)
    answers.map(&:comment).reject(&:empty?)
  end

end
