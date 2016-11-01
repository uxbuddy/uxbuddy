class TestsController < ApplicationController

  before_action :find_test, only: [:show, :share, :thanks]

  def new
    if user_signed_in?
      check_test_in_progress
      @test_types = TestType.all
      @questions = Question.all
    else
      flash[:notice] = 'Please sign in to create a test'
      redirect_to new_user_registration_path
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      @test.update(user_id: current_user.id)
      @test.update(slug: @test.name.downcase.split(" ").join("-"))
      redirect_to share_test_path(@test)
    else
      flash[:error] = @test.errors.full_messages.map{|o| o  }.join("/")
      session[:test] = test_params
      redirect_to new_test_path
    end
  end

  def index
    if user_signed_in?
      @tests = Test.where(user_id: current_user.id)
    else
      flash[:notice] = 'Please sign in to view your tests'
      redirect_to new_user_registration_path
    end
  end

  def show
    check_github
    @questions = @test.questions
  end

  def share
  end

  def email
    list = email_parser(params[:emails][:emails])
    url = request.original_url[0...-6]
    TestMailer.send_test_email(current_user, list, url).deliver
  end

  def thanks
  end

  private

  def test_params
    params.require(:test).permit(:name, :test_url, :test_type_id, :question_ids => [])
  end

  def email_parser(emails)
    emails.delete(" ").split(",")
  end

  def find_test
    @test = Test.friendly.find(params[:id])
  end

  def check_github
    if @test.test_url.include? "github.com"
      @iframe_url = "https://htmlpreview.github.io/?"+ @test.test_url
    else
      @iframe_url = @test.test_url
    end
  end

  def check_test_in_progress
    if session[:test]
      @test = Test.new(session[:test])
      session[:test] = nil
    else
      @test = Test.new
    end
  end

end
