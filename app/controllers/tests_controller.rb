class TestsController < ApplicationController

  def new
    @test = Test.new
    @test_types = TestType.first
    @questions = Question.all
    @question1 = Question.find(1)
    @question2 = Question.find(2)
  end

  def create
    @test = Test.create(test_params)
    @test.questions << Question.find(1)
    if @test.save
      redirect_to thanks_test_path(@test)
    else
      # flash
      redirect_to new_test_path
    end
  end

  def show
    @test = Test.find(params[:id])
  end

  def thanks
    @test = Test.find(params[:id])
    puts "Here"
    puts @test.name
  end

  private

  def test_params
    params.require(:test).permit(:name, :test_url, test_type: 1)
  end

end
