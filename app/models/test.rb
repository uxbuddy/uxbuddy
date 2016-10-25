class Test < ApplicationRecord
  has_one :test_type
  has_and_belongs_to_many :questions
end
