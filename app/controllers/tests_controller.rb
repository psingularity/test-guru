class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def create 
    test = Test.new(test_params)
    if test.save
      redirect_to tests_path
    else
      render plain: 'Тест с невалидными данными.'
    end
  end

  def destroy    
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
