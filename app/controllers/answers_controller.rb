class AnswersController < ApplicationController

  def create
    answer = Answer.new(answer_params)
    @test = Test.friendly.find(params[:test_id])
    answer.test_id = @test.id
    answer.question_id = @test.questions[params[:answer][:question_no].to_i].id
    answer.format = answer.question.format
    answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:format, :response, :comment, :question_no, :question_id, :test_id)
  end

  def assign_question

  end
end
