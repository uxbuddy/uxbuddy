class AnswersController < ApplicationController

  def create
    Answer.create(answer_params)
  end

  private

  def answer_params
    params.require(:answer).permit(:format, :response, :question_id)
  end
end
