class Admin::StaffsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_staff, only: [:show, :update]
  before_action :set_q, only: [:index]

  def index
    @results = @q.result.page(params[:page]).per(10)
  end

  def show
    gon.categories = []
    my_achievement = []
    total = []
    gon.myARates = []
    gon.myARatesMinus = []

    @categories = Category.all
    gon.categories = @categories.map(&:name)

    @my_achievement = AchievementRate.where(staff_id: @staff).where(status: true)

    @categories.each do |category|
      total << category.questions.count
      my_achievement << @my_achievement.where(category_id: category.id).count
    end

    @categories.length.times do |i|
      gon.myARates << begin
                         my_achievement[i] * 100 / total[i]
                      rescue
                        0
                       end
      gon.myARatesMinus << begin
                              100 - my_achievement[i] * 100 / total[i]
                           rescue
                             100
                            end
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

  def set_q
    @q = Staff.ransack(params[:q])
  end

  def ensure_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:status, :employ_number)
  end
end
