class Admin::StaffsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_staff, only: [:show,:update]

  def index
    @staffs = Staff.all
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

  def update
    if @staff.status?
      @staff.update_columns(status: false)
    else
      @staff.update_columns(status: true)
    end
    redirect_to admin_staff_path(@staff)
  end

  private

  def ensure_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:status,:employ_number)
  end
end
