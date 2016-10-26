class Question < ApplicationRecord
  has_many :answers
  has_and_belongs_to_many :test_types
  has_and_belongs_to_many :tests
end
