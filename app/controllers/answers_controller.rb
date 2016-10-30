class AnswersController < ApplicationController

  def create
    answer = Answer.new(answer_params)
    answer.format = answer.question.format
    answer.test_id = Test.friendly.find(params[:test_id]).id
    answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:format, :response, :comment, :question_id, :test_id)
  end
end
