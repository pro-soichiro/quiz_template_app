class Public::StaffsController < ApplicationController
  # before_action :authenticate_public!
  before_action :ensure_staff, only: [:show,:edit,:update]

  def index
    @achievement_rates = AchievementRate.where(staff_id: current_staff).where(status: false).order(:category_id)
  end

  def show
    @categories = Category.all
    @achievement_rates_count = AchievementRate.where(staff_id: current_staff).where(status: false).count

    @correct_answer_rates = CorrectAnswerRate.where(staff_id: current_staff)
    correct_answer_total = @correct_answer_rates.count
    correct_answer_true_count = @correct_answer_rates.where(status: true).count
    @my_correct_answer_rate = ( correct_answer_true_count * 100 / correct_answer_total rescue 0 )

    gon.categories = @categories.pluck(:name).map(&:to_s)
    myAchievement = []
    total = []
    gon.myARates = []
    gon.myARatesMinus = []

    @myAchievement = AchievementRate.where(staff_id: @staff).where(status: true)

    @categories.each do |category|
      total << category.questions.count
      myAchievement << @myAchievement.where(category_id: category.id).count
    end


    @categories.length.times do |i|
      gon.myARates << ( myAchievement[i] * 100 / total[i] rescue 0 )
      gon.myARatesMinus << ( 100 - myAchievement[i] * 100 / total[i] rescue 100 )
    end

  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      Rails.logger.debug "@staff : #{@staff.inspect}"
      redirect_to staff_path(@staff)
    else
      render :edit
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:id,
                                  :last_name,
                                  :last_name_kana,
                                  :first_name,
                                  :first_name_kana,
                                  :image)
  end

  def ensure_staff
    @staff = Staff.find(params[:id])
  end
end
