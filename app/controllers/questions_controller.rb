class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue_with_questions_not_found

  def show
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      flash[:good] = t('.success')
      redirect_to admin_test_url(@test)
    else
      render :new
    end
  end

  def new
    @question = @test.questions.new
  end

  def update
    if @question.update(question_params)
      flash[:good] = t('.success')
      redirect_to admin_question_url(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:good] = t('.success')
    redirect_to admin_test_url(@question.test)
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
    render html: "Question doesn't exist!".html_safe
  end

end
