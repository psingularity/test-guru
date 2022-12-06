class QuestionsController < ApplicationController
  
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test,  only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def create
    #question = Question.create(question_params)
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question.test
    else
      render plain: 'Вопрос с невалидными данными.'
    end    
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
  
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end

end
