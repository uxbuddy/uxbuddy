class TestType < ApplicationRecord
  has_and_belongs_to_many :questions, join_table: "questions_test_types"
end
