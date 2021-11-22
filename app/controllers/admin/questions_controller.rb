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
    @question = Form::Question.new()
  end

  def edit
		@question = Form::Question.find(params[:id])
  end

  def create
    @question = Form::Question.new(question_params)
    if @question.save
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  def update
		if @question.update(question_params)
			redirect_to admin_questions_path
		else
			render :edit
		end
  end

  def destroy
		Question.find(params[:id]).destroy
		redirect_to admin_questions_path
  end


  private

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