class Public::CorrectAnswerRatesController < ApplicationController
  def index
    @staffs = Staff.all
  end
end
