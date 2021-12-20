class Public::CorrectAnswerRatesController < ApplicationController
  before_action :authenticate_staff!

  def index
    staffs = Staff.all
    @categories = Category.all
    @category_id = params[:category]
    if params[:category]
      @category = @categories.find(params[:category])
    end
    # ランキングのためにidを入れ替える
    staffs_hash = staffs.map { |staff| [staff.id, staff.correct_rates(@category_id)] }.to_h
    sort_staffs_hash = staffs_hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    ids = sort_staffs_hash.keys
    @staffs = staffs.where(id: ids).order_as_specified(id: ids).page(params[:page]).per(10)
    # binding.pry
  end
end
