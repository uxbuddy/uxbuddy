class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :test
  attr_accessor :question_no
end
