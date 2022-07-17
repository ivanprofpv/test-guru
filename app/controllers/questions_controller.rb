class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_questions, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue_with_questions_not_found

  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @test.questions.create(question_params)
    redirect_to action: 'index', id: @test.id

  def new
  end

  def destroy
    @question.destroy
    redirect_to action: 'index', id: @test.id
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_questions
    @question = Question.find(params[:id])
  end

  def rescue_with_questions_not_found
    render html: "Вопрос не найден!".html_safe
  end

end
