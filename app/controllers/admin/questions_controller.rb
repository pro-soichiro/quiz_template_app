class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_question, only: [:edit,:update,:destroy]
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
    @question = Form::Question.new
  end

  def import_get

  end

  def import
    Question.import(params[:file])
    redirect_to new_admin_question_path
  end

  def edit
		@question = Form::Question.find(params[:id])
		choice_index = @question.choices.count

		gon.choice_index = choice_index + 1
		@choice_index = choice_index
  end

  def create
    @question = Form::Question.new(question_params)
    if @question.save
      redirect_to action: :index,category: @question.category_id
    else
      gon.choice_index = 4
      render :new
    end
  end

  def update
		if @question.update(question_params)
			redirect_to action: :index,category: @question.category_id
		else
  		choice_index = @question.choices.count

  		gon.choice_index = choice_index + 1
  		@choice_index = choice_index
			render :edit
		end
  end

  def destroy
		Question.find(params[:id]).destroy
		redirect_to action: :index,category: @question.category_id
  end


  private

  def set_q
    @q = Question.ransack(params[:q])
  end

  def question_params
    params
			.require(:form_question)
			.permit(
				Form::Question::REGISTRABLE_ATTRIBUTES +
				[choices_attributes: Form::Choice::REGISTRABLE_ATTRIBUTES]
			)
  end

  def ensure_question
    @question = Form::Question.find(params[:id])
  end

end