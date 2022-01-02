class Public::StaffsController < ApplicationController
  before_action :authenticate_staff!
  before_action :ensure_staff, only: [:edit, :update]

  def wrong_answer
    @wrong_answers = current_staff.wrong_answers.page(params[:page]).per(10).order(:category_id)
  end

  def show
    @categories = Category.all
    @staff = Staff.find(current_staff.id)

    gon.categories = @categories.map(&:name)
    gon.myARates = []
    gon.myARatesMinus = []

    @categories.each do |category|
      gon.myARates << (@staff.achievement_rates(category.id))
      gon.myARatesMinus << (100 - @staff.achievement_rates(category.id))
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
