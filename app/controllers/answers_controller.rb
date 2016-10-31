class AnswersController < ApplicationController

  def create
    test = Test.friendly.find(params[:test_id])
    question_no =  params[:answer][:question_no]
    Answer.build_answer(answer_params, test, question_no)
  end

  private

  def answer_params
    params.require(:answer).permit(:format, :response, :comment, :question_no, :question_id, :test_id)
  end

end
