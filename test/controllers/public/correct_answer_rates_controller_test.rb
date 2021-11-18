require 'test_helper'

class Public::CorrectAnswerRatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_correct_answer_rates_index_url
    assert_response :success
  end

end
