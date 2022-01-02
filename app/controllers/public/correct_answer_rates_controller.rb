class Public::CorrectAnswerRatesController < ApplicationController
  before_action :authenticate_staff!

  def index
    staffs = Staff.all
    @categories = Category.all
    if params[:category].present?
      @category = @categories.find(params[:category])
      @category_id = params[:category]
    else
      @category_id = nil
    end
    # ランキングのためにidを入れ替える
    staffs_hash = staffs.map { |staff| [staff.id, staff.correct_rates(@category_id)] }.to_h
    sort_staffs_hash = staffs_hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }.to_h
    ids = sort_staffs_hash.keys
    @staffs = staffs.where(id: ids).order_as_specified(id: ids).limit(10)
  end
end
