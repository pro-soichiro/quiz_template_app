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
    @question = Question.new
    @question.choices.build()
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_path
    else
      @question = Question.new
      @question.choices.build
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
    params.require(:question).permit( :category_id,
                                      :content,
                                      :image,
                                      choices_attributes:[:question_id, :content, :is_answer])
  end

  def ensure_question
    @question = Question.find(params[:id])
  end
end
