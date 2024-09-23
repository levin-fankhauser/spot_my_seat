require "test_helper"

class SeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seats_index_url
    assert_response :success
  end

  test "should get show" do
    get seats_show_url
    assert_response :success
  end

  test "should get new" do
    get seats_new_url
    assert_response :success
  end

  test "should get edit" do
    get seats_edit_url
    assert_response :success
  end

  test "should get create" do
    get seats_create_url
    assert_response :success
  end

  test "should get update" do
    get seats_update_url
    assert_response :success
  end

  test "should get destroy" do
    get seats_destroy_url
    assert_response :success
  end
end
