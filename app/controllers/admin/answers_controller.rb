class AnswersController < ApplicationController
  before_action :find_question, only: %i[ new create ]
  before_action :set_answer, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)
      if @answer.save
        flash[:good] = t('.success')
        redirect_to admin_answer_url(@answer)
      else
        render :new
      end
  end

  def update
    if @answer.update(answer_params)
      flash[:good] = t('.success')
      redirect_to admin_answer_url(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    flash[:good] = t('.success')
    redirect_to admin_question_url(@answer.question)
  end

  private

    def find_question
      @question = Question.find(params[:question_id])

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end