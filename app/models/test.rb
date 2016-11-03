class Test < ApplicationRecord
  extend FriendlyId
  friendly_id :id, use: :slugged

  has_one :user
  has_one :test_type
  has_and_belongs_to_many :questions, join_table: "tests_questions"
  has_many :answers, through: :questions
  has_attached_file :snapshot, styles: { medium: "300x300#", thumb: "100x100>" }, :default_url => "default_image.jpg"

  # validates :user, presence: true
  validates :test_url, presence: true
  validates :question_ids, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :test_url, format: { with: URI.regexp }, if: 'test_url.present?'
  validates_attachment_content_type :snapshot, :content_type => /\Aimage\/.*\Z/

  def number_respondents
    self.questions[0].answers.where(test_id: self.id).count
  end

  def average_score
    answers = self.answers.where(test_id: self.id)
    return "Awaiting responses" if answers.count == 0
    answers.average(:response).round(1)
  end

  def complete_respondents
    complete = self.questions[-1].answers.where(test_id: self.id).count
    return "Awaiting responses" if number_respondents == 0
    ((complete * 100) / number_respondents).to_s + "%"
  end



end
