class Test < ApplicationRecord
  extend FriendlyId
  friendly_id :id, use: :slugged

  has_one :test_type
  has_and_belongs_to_many :questions, join_table: "tests_questions"
  has_many :answers, through: :questions
end
