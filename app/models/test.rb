class Test < ApplicationRecord
  has_one :test_type
  has_and_belongs_to_many :questions, join_table: "tests_questions"
  has_many :answers, through: :questions
end
