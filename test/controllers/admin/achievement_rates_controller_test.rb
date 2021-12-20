require 'test_helper'

class Admin::AchievementRatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_achievement_rates_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_achievement_rates_update_url
    assert_response :success
  end
end
