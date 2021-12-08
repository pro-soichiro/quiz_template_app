class Public::CorrectAnswerRatesController < ApplicationController
  def index
    @correct_answer_rates = CorrectAnswerRates.where()
  end
end
