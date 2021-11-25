class Public::AchievementRatesController < ApplicationController
  def create
    @achievement_rate = AchievementRate.new
    @achievement_rate.staff_id = current_staff.id
    @achievement_rate.question_id = @question
    binding.pry
    @achievement_rate.save
    redirect_to questions_answer_path
  end

  def update
  end

  private
  def achievement_rate_params
    params.require(:achievement_rate).permit(:staff_id,:question_id,:status)
  end
end
