class AnswersController < ApplicationController

  def create
    answer = Answer.new(answer_params)
    answer.format = answer.question.format
    answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:format, :response, :question_id)
  end
end
