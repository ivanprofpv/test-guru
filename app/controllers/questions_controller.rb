class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue_with_questions_not_found

  def index
  end

  def show
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def new
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_questions_not_found
    render html: "Вопрос не найден!".html_safe
  end

end
