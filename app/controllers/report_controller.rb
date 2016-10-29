class ReportController < ApplicationController

  def index
    @test = Test.friendly.find(params[:test_id])
    @questions = @test.questions
    @answers = @test.answers.where(test_id: params[:test_id])
  end
end
