class ReportController < ApplicationController

  def index
    @test = Test.find(params[:test_id])
    @answers = @test.answers
  end
end
