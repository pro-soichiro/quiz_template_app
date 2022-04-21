class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_question, only: [:edit, :update, :destroy]
  before_action :set_q, only: [:index]

  def index
    @categories = Category.all
    @search = Question.ransack(params[:q])

    if params[:category]
      @category = @categories.find(params[:category])
      all_questions = Question.where(category_id: @category).order(created_at: :desc)
    elsif params[:q]
      all_questions = @search.result
    else
      all_questions = Question.order(created_at: :desc).limit(3)
    end

    @questions = all_questions.page(params[:page]).per(3)
    @all_questions_count = all_questions.count
  end

  def new
    @question = Question.new
    4.times { @question.choices.new }
  end

  def create
    @question = Question.new(question_params)
    @question.true_answer_check(@question)
    if @question.save
      redirect_to action: :index, category: @question.category_id
    else
      render :new
    end
  end

  def edit
    choice_index = @question.choices.count
    gon.choice_index = choice_index + 1
  end

  def update
    @question.true_answer_check(@question)
    if @question.update_attributes(question_params)
      redirect_to action: :index, category: @question.category_id
    else
      choice_index = @question.choices.count

      gon.choice_index = choice_index + 1
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to action: :index, category: @question.category_id
  end

  private

  def set_q
    @q = Question.ransack(params[:q])
  end

  def question_params
    params.
      require(:question).
      permit(
        :question_text,
        :category_id,
        :image,
        choices_attributes: [
          :id,
          :choice_text,
          :is_answer,
          :_destroy,
        ]
      )
  end

  def ensure_question
    @question = Question.find(params[:id])
  end
end
