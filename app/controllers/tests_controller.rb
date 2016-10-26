class TestsController < ApplicationController

  def new
    @test = Test.new
    @questions = Question.all
    @question1 = Question.find(1)
    @question2 = Question.find(2)
  end

  def create
  end 

  def show
    @test = Test.find(params[:id])
  end

end
