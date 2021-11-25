class Public::StaffsController < ApplicationController
  # before_action :authenticate_public!
  before_action :ensure_staff, only: [:show,:edit,:update]

  def index
  end

  def show

    @categories = Category.all

    gon.categories = @categories.pluck(:name).map(&:to_s)
    myAchievement = []
    total = []
    gon.myARates = []
    gon.myARatesMinus = []

    @myAchievement = AchievementRate.where(staff_id: @staff)

    @categories.each do |category|
      total << category.questions.count
      myAchievement << @myAchievement.where(category_id: category.id).count
    end

    @categories.length.times do |i|
      gon.myARates << (myAchievement[i].to_f / total[i] * 100 ).floor
      gon.myARatesMinus << 100 - (myAchievement[i].to_f / total[i] * 100 ).floor
    end

  end

  def edit
  end

  def update
    # binding.pry
    if @staff.update(staff_params)
      Rails.logger.debug "@staff : #{@staff.inspect}"
    # binding.pry
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
