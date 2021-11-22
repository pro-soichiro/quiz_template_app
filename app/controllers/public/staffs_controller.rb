class Public::StaffsController < ApplicationController
  # before_action :authenticate_public!
  before_action :ensure_staff, only: [:show,:edit,:update]

  def index
  end

  def show
  end

  def edit
    # binding.pry
  end

  def update
    # binding.pry
    if @staff.update(staff_params)
      redirect_to staff_path(@staff)
    else
      render :edit
    end
  end

  private

  def ensure_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:last_name,
                                  :last_name_kana,
                                  :first_name,
                                  :first_name_kana,
                                  :email,
                                  :employ_number,
                                  :image)
  end
end
