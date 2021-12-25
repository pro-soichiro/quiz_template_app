class Public::QuestionsController < ApplicationController
  before_action :authenticate_staff!

  def categories
    @categories = Category.all
  end

  def new
    session[:category] = Category.find(params[:id])
    @questions = Question.where(category_id: session[:category])

    if @questions.count == 0
      redirect_to({ action: :categories }, { alert: '問題がまだありません。' })
    elsif @questions.count <= 10
      @max = @questions.count
    else
      @max = 10
    end
  end

  def start
    total = params[:number].to_i
    all = Question.where(category_id: session[:category]["id"]).map { |x| x.id }
    session[:questions] = all.sort_by { rand }[0..(total - 1)]
    session[:total] = total
    session[:selected] = []
    session[:current] = 0
    session[:correct] = 0
    redirect_to action: :answer
  end

  def answer
    @current = session[:current]
    @total   = session[:total]

    if @current >= @total
      redirect_to action: :result
      return
    end

    @question = Question.find(session[:questions][@current])
    @choices = @question.choices.sort_by { rand }

    session[:question] = @question
    session[:choices] = @choices
  end

  def sub_result
    p params[:selected_choices]
    session[:current] += 1

    @current = session[:current]
    @total   = session[:total]

    @selected_choice_ids = params[:selected_choices].map { |x| x.to_i }

    @question = Question.find(session[:question]["id"])
    @choices  = session[:choices]

    @selected_choices = Choice.where(id: @selected_choice_ids)

    session[:selected].concat(@selected_choice_ids)

    @all_correct_count = 0
    @choices.each { |choice| @all_correct_count += 1 if choice["is_answer"] }
    @choice_true_count = 0
    @selected_choices.each { |choice| @choice_true_count += 1 if choice.is_answer }
    @correct_answer_rate = CorrectAnswerRate.new
    @correct_answer_rate.staff_id = current_staff.id
    @correct_answer_rate.question_id = @question["id"]
    @correct_answer_rate.category_id = @question["category_id"]

    @achievement_rate = AchievementRate.find_or_initialize_by(staff_id: current_staff.id,
                                                              question_id: @question["id"])
    @achievement_rate.category_id = @question["category_id"]

    if @all_correct_count == @selected_choice_ids.count && @all_correct_count == @choice_true_count
      @correct = true
      session[:correct] += 1
      @achievement_rate.status = true
      @correct_answer_rate.status = true
    else
      @correct = false
      @achievement_rate.status = false
      @correct_answer_rate.status = false
    end
    @achievement_rate.save
    @correct_answer_rate.save
  end

  def result
    @correct = session[:correct]
    @total   = session[:total]

    @questions = Question.where(id: session[:questions]).order_as_specified(id: session[:questions])

    @selected = session[:selected]

    @score = @correct * 100 / @total
  end

  private

  def question_params
    params.require(:category).premit(:id, :category_id)
  end
end
