class Public::QuestionsController < ApplicationController
  # before_action :authenticate_public!

  def categories
    @categories = Category.all
  end

  def new
    @questions = Question.find(category_id: params[:id])
  end

  def answer
  end

  def result
  end

  private
  def question_params
    params.require(:category).premit(:id)
  end
end
