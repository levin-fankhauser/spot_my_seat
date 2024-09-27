require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @admin_user = users(:two)
    sign_in @admin_user
  end

  test "should get index" do
    get users_url
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { username: "UpdatedUser", email: "updated@example.com" } }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "UpdatedUser", @user.username
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end

  test "should deny access for non-admin on index" do
    sign_out @admin_user
    sign_in @user
    get users_url
    assert_redirected_to root_path
  end

  test "should deny access for non-admin on edit" do
    sign_out @admin_user
    sign_in @user
    get edit_user_url(@admin_user)
    assert_redirected_to root_path
  end
end
