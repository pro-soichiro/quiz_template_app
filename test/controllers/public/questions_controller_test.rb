require 'test_helper'

class Public::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get categories" do
    get public_questions_categories_url
    assert_response :success
  end

  test "should get new" do
    get public_questions_new_url
    assert_response :success
  end

  test "should get answer" do
    get public_questions_answer_url
    assert_response :success
  end

  test "should get result" do
    get public_questions_result_url
    assert_response :success
  end
end
