class ReportController < ApplicationController

  def index
    @test = Test.friendly.find(params[:test_id])
    @respondents = @test.questions[0].answers.where(test_id: @test.id).count
  end
end
