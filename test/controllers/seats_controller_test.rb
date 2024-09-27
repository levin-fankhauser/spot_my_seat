require "test_helper"

class SeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seat = seats(:one)
    @user = users(:one)
    @admin = users(:two)
    sign_in @user
  end

  test "should get index" do
    get seats_url
    assert_response :success
    assert_not_nil assigns(:seats)
  end

  test "should show seat" do
    get seat_url(@seat)
    assert_response :success
  end

  test "should get new" do
    get new_seat_url
    assert_response :success
  end

  test "should create seat" do
    assert_difference("Seat.count") do
      post seats_url, params: { seat: { train: "IR27", wagons: 5, current_wagon: 2, seat_number: 15, floor: 1 } }
    end

    assert_redirected_to seat_url(Seat.last)
  end

  test "should get edit" do
    get edit_seat_url(@seat)
    assert_response :success
  end

  test "should update seat" do
    patch seat_url(@seat), params: { seat: { train: "S3", wagons: 6, current_wagon: 1, seat_number: 12, floor: 0 } }
    assert_redirected_to seat_url(@seat)
    @seat.reload
    assert_equal "S3", @seat.train
    assert_equal 0, @seat.floor
  end

  test "should destroy seat" do
    assert_difference("Seat.count", -1) do
      delete seat_url(@seat)
    end

    assert_redirected_to seats_url
  end

  test "should allow admin to access admin_index" do
    sign_in @admin
    get admin_seats_url
    assert_response :success
  end
end
