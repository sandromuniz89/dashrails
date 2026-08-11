require "test_helper"

class FinanceiroControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get financeiro_index_url
    assert_response :success
  end

  test "should get new" do
    get financeiro_new_url
    assert_response :success
  end

  test "should get create" do
    get financeiro_create_url
    assert_response :success
  end

  test "should get destroy" do
    get financeiro_destroy_url
    assert_response :success
  end
end
