class Public::StaffsController < ApplicationController
  # before_action :authenticate_public!
  before_action :ensure_staff, only: [:show,:edit,:update]

  def index
    @achievement_rates = AchievementRate.where(staff_id: current_staff).where(status: false).order(:category_id)
  end

  def show
    @categories = Category.all

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
