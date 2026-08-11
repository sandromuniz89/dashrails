require "test_helper"

class FornecedoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fornecedores_index_url
    assert_response :success
  end

  test "should get show" do
    get fornecedores_show_url
    assert_response :success
  end

  test "should get new" do
    get fornecedores_new_url
    assert_response :success
  end

  test "should get create" do
    get fornecedores_create_url
    assert_response :success
  end

  test "should get edit" do
    get fornecedores_edit_url
    assert_response :success
  end

  test "should get update" do
    get fornecedores_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fornecedores_destroy_url
    assert_response :success
  end
end
