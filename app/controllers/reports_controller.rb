class ReportsController < ApplicationController

  def show
    @test = Test.friendly.find(params[:id])
    @questions = @test.questions
    @respondents = @test.questions[0].answers.where(test_id: @test.id).count
    @answers = Answer.all
  end


  private

  def test_params
    params.require(:test).permit(:name, :test_url, :test_type_id, :question_ids => [])
  end


end
