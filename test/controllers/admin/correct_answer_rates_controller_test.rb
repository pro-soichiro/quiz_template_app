require 'test_helper'

class Admin::CorrectAnswerRatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_correct_answer_rates_create_url
    assert_response :success
  end

end
