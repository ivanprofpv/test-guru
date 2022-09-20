class Admin::TestsController < Admin::BaseController

  before_action :set_tests, only: %i[index update]
  before_action :set_test, only: %i[show edit update destroy start update_inline]

  def index
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
      redirect_to admin_test_url(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      flash[:good] = t('.success')
      redirect_to admin_test_url(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy

    @test.destroy
    flash[:good] = t('.success')
    redirect_to admin_tests_url
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
