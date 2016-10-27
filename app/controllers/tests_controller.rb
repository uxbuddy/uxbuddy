class TestsController < ApplicationController

  def new
    @test = Test.new
    @test_types = TestType.all
    @questions = Question.all
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to thanks_test_path(@test)
    else
      redirect_to new_test_path
    end
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def thanks
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:name, :test_url, :test_type_id, :question_ids)
  end

end
