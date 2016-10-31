class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :test
  attr_accessor :question_no

  def self.build_answer(params, test, q_num)
    answer = self.new(params)
    answer.test_id = test.id
    answer.question_id = test.questions[q_num.to_i].id
    answer.format = answer.question.format
    answer.save
  end

end
