class Public::AchievementRatesController < ApplicationController
  before_action :authenticate_staff!

  def create
  end

  def update
  end

  private

  def achievement_rate_params
    params.require(:achievement_rate).permit(:staff_id,
                                              :category_id,
                                              :question_id,
                                              :selected,
                                              :status)
  end
end
