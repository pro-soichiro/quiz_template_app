class Admin::StaffsController < ApplicationController
  before_action :ensure_staff, only: [:show,:update]

  def index
    @staffs = Staff.all
  end

  def show
  end

  def update
    if @staff.status?
      # binding.pry
      @staff.update_columns(status: false)
      # @staff.status = false
      # @staff.save
    else
      @staff.update_columns(status: true)
      # @staff.status = true
      # @staff.save
    end
    redirect_to admin_staff_path(@staff)
  end

  private

  def ensure_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:id,:status,:employ_number)
  end
end
