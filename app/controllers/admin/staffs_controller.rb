class Admin::StaffsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_staff, only: [:show,:update]

  def index
    @staffs = Staff.all
  end

  def show
    gon.categories = []
    myAchievement = []
    total = []
    gon.myARates = []
    gon.myARatesMinus = []

    gon.categories.clear
    myAchievement.clear
    total.clear
    gon.myARates.clear
    gon.myARatesMinus.clear

    @categories = Category.all
    gon.categories = @categories.pluck(:name).map(&:to_s)

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
