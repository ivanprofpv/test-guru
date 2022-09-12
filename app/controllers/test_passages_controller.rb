class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ show update result gist ]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def gist
    gist_new = GistQuestionService.new(@test_passage.current_question)
    result = gist_new.call

    if gist_new.success?
      question_title = @test_passage.current_question.title
      current_user.gists.create(url: result.id, question_id: @test_passage.current_question.id)

      flash_options = { notice: t('.success') + " #{result.html_url}" }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
