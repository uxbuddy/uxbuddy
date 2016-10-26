class TestsController < ApplicationController

  def new
    @test = Test.new
    @test_types = TestType.first
    @questions = Question.all
    @question1 = Question.find(1)
    @question2 = Question.find(2)
  end

  def create
    @test = Test.new(name: params[:name], test_url: params[:test_url], test_type_id: params[:test_type])
    @test.questions << Question.find(1)
    @test.save
  end

  def show
    @test = Test.find(params[:id])
  end

end
