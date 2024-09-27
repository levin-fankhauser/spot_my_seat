require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = "short"
    assert_not @user.valid?
  end

  test "should not save invalid user" do
    invalid_user = users(:invalid)  # Verwende die ungültige Fixture
    assert_not invalid_user.save
  end

  test "admin? should return true for admin users" do
    admin_user = users(:two)  # Admin-Benutzer aus den Fixtures
    assert admin_user.admin?
  end

  test "admin? should return false for non-admin users" do
    assert_not @user.admin?
  end
end
