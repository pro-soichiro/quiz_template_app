class Public::QuestionsController < ApplicationController
  # before_action :authenticate_public!

  def categories
    @categories = Category.all
  end

  def new
    # @categories = Category.all
    # binding.pry
    @category = Category.find(params[:category_id])
    @questions = @category.questions
  end

  def answer
  end

  def result
  end

  private
  def question_params
    params.require(:category).premit(:id,:category_id)
  end
end
