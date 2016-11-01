class ReportsController < ApplicationController

  def show
    if user_signed_in?
    @test = Test.friendly.find(params[:id])
    @questions = @test.questions
    @respondents = @test.questions[0].answers.where(test_id: @test.id).count
    @library = {xtitle: 'Average response',
                hAxis: {ticks: [1,2,3,4,5]},
                chartArea: {left: 500, width: 600},
                }
    answers = @test.answers
    @data = answers.where(test_id: @test.id).group('text').average(:response)
    else
      flash[:notice] = 'Please sign in to view your tests'
      redirect_to new_user_registration_path
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, :test_url, :test_type_id, :question_ids => [])
  end

end
