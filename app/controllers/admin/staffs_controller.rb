class Admin::StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def update
  end
  
  private
  
  def staff_params
    params.require(:staff).permit(:id)
  end
end
