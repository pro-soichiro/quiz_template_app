class Public::StaffsController < ApplicationController
  # before_action :authenticate_public!
  before_action :ensure_staff, only: [:show,:edit,:update]

  def index
    @achievement_rates = AchievementRate.where(staff_id: current_staff).where(status: false).order(:category_id)
  end

  def show
    @categories = Category.all

    # 誤答問題数
    @achievement_rates_count = AchievementRate.where(staff_id: current_staff).where(status: false).count

    gon.categories = @categories.pluck(:name).map(&:to_s)
    gon.myARates = []
    gon.myARatesMinus = []
    
    @categories.each do |category|
      gon.myARates << ( @staff.achievement_rates(category.id) )
      gon.myARatesMinus << ( 100 - @staff.achievement_rates(category.id) )
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
