require 'test_helper'

class Admin::StaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_staffs_top_url
    assert_response :success
  end

  test "should get show" do
    get admin_staffs_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_staffs_update_url
    assert_response :success
  end

end
