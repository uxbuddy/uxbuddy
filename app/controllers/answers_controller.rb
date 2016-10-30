class AnswersController < ApplicationController

  def create
    answer = Answer.new(answer_params)
    @test = Test.friendly.find(params[:test_id])
    answer.test_id = @test.id
    @questions = @test.questions
    puts "HIIIIIII"
    puts @test.id
    puts @questions[0]
    puts @questions[1]
    p params[:question_no].to_i
    puts @questions[params[:question_no].to_i]
    answer.question_id = @test.questions[params[:question_no].to_i].id
    answer.format = answer.question.format
    answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:format, :response, :question_no, :question_id, :test_id)
  end
end
