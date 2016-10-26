class TestsController < ApplicationController

  def new
    @test = Test.new
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

end
