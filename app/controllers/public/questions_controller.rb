class Public::QuestionsController < ApplicationController
  # before_action :authenticate_public!

  def categories
    @categories = Category.all
  end

  def new
    @category = Category.find(params[:category_id])
    @questions = Question.where(category_id: @category)

    if @questions.count == 0 then
      redirect_to({action: :categories},{notice: '問題がまだありません。'})
    elsif @questions.count <= 10 then
      @max = @questions.count
    else
      @max = 10
    end
  end

  def start
    total = params[:number].to_i
    all = Question.where(category_id: params[:category]).map {|x| x.id}
    session[:questions] = all.sort_by{rand}[0..(total-1)]
    session[:total]   = total
    session[:selected]  = []
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
    @choices = @question.choices.sort_by{rand}

    session[:question] = @question
    session[:choices] = @choices

  end

  def sub_result

    @current = session[:current]
    @total   = session[:total]

    choiceid = params[:selected]
    @question = session[:question]
    @choices  = session[:choices]

    @choice = choiceid ? Choice.find(choiceid) : nil
    session[:selected] << @choice.id
    if @choice and @choice.is_answer
      @correct = true
      session[:correct] += 1
      @achievement_rate = AchievementRate.new
      @achievement_rate.staff_id = current_staff.id
      @achievement_rate.question_id = @question["id"]
      @achievement_rate.category_id = @question["category_id"]
      @achievement_rate.status = true
      @achievement_rate.save
    elsif @choice
      @achievement_rate = AchievementRate.new
      @achievement_rate.staff_id = current_staff.id
      @achievement_rate.question_id = @question["id"]
      @achievement_rate.category_id = @question["category_id"]
      @achievement_rate.status = false
      @achievement_rate.save
    else
      @correct = false
    end

    session[:current] += 1
  end


  def result

    @correct = session[:correct]
    @total   = session[:total]

    @questions = Question.where(id: session[:questions])

    @question = session[:question]
    @choices  = session[:choices]
    @selected = session[:selected]

    @score = @correct * 100 / @total

  end

  private
  def question_params
    params.require(:category).premit(:id,:category_id)
  end


end
