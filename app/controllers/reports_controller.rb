class ReportsController < ApplicationController

  def show
    if user_signed_in?
    @test = Test.friendly.find(params[:id])
    @questions = @test.questions
    @respondents = @test.number_respondents
    @library = {xtitle: 'Average response',
                hAxis: {ticks: [1,2,3,4,5]},
                chartArea: {left: 500, width: 600},
                }
    answers = @test.answers
    @data = answers.where(test_id: @test.id).group('text').average(:response)
    else
      flash[:notice] = 'Please sign in to view your reports'
      redirect_to new_user_registration_path
    end
  end

  def index
    if user_signed_in?
      redirect_to tests_path
    else
      flash[:notice] = 'Please sign in to view your reports'
      redirect_to new_user_registration_path
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, :test_url, :test_type_id, :question_ids => [])
  end

end
