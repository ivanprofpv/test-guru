class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[ show update result ]

  def show

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_toresult_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result

  end

  private

  def set_test_passage
    @test_passage = TestPassage.find_by(params[:id])
  end

end
