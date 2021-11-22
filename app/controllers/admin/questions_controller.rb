class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_question, only: [:edit,:update,:destroy]

  def index
    @categories = Category.all
    if params[:category_id]
      @category = @categories.find(params[:category_id])
      all_questions = @category.questions
    else
      all_questions = Question.order(created_at: :desc).limit(3)
    end

    @questions = all_questions.page(params[:page]).per(3)
    @all_questions_count = all_questions.count
  end

  def new
    @question = QuestionChoice.new
  end

  def create
    # binding.pry
    @question = QuestionChoice.new(question_params)
    if @question.saves
      redirect_to admin_questions_path
    else
      @question = Question.new
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def question_params
    params.require(:question_choice).permit(
                                      :category_id,
                                      :question_text,
                                      :image,
                                      :question_id,
                                      :choice_text,
                                      :is_answer)
  end

  def ensure_question
    @question = Question.find(params[:id])
  end
end
