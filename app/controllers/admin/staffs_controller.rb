class Admin::StaffsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_staff, only: [:show,:update]

  def index
    @staffs = Staff.all
  end

  def show
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
