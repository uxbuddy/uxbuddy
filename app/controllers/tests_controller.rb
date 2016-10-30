class TestsController < ApplicationController

  before_action :find_test, only: [:show, :share, :thanks]

  def new
    if user_signed_in?
      @test = Test.new
      @test_types = TestType.all
      @questions = Question.all
    else
      flash[:notice] = 'Please sign in to create a test'
      redirect_to new_user_registration_path
    end
  end

  def create
    @test = Test.new(test_params)
    if current_user
      @test.user_id = current_user.id
    end
    if @test.save
      @test.update(slug: @test.name.downcase.split(" ").join("-"))
      redirect_to share_test_path(@test)
    else
      flash[:error] = @test.errors.full_messages.map{|o| o  }.join("")
      redirect_to new_test_path
    end
  end

  def index
    @tests = Test.where(user_id: current_user.id)
  end

  def show
    @questions = @test.questions
  end

  def share
  end

  def thanks
  end

  private

  def test_params
    params.require(:test).permit(:name, :test_url, :test_type_id, :question_ids => [])
  end

  def find_test
    @test = Test.friendly.find(params[:id])
  end

  def status
    self.status
  end

end
