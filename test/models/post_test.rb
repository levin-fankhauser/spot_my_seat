require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = posts(:one)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = ""
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = ""
    assert_not @post.valid?
  end

  test "should belong to user" do
    assert_equal @user, @post.user
  end

  test "should not save invalid post" do
    invalid_post = posts(:invalid)
    assert_not invalid_post.save
  end
end
