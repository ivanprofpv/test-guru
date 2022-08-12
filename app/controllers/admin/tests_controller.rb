class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
  end

  def edit
  end

  def create
    @test = current_user.created_tests.create(test_params)

    if @test.save
      flash[:good] = t('.success')
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      flash[:good] = "Test updated!"
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy

    @test.destroy
    flash[:good] = "Test deleted!"
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
  end
