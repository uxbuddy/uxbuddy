class ReportController < ApplicationController

  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions
  end
end
