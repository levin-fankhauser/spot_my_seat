require "test_helper"

class SeatTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @seat = seats(:one)
  end

  test "should be valid" do
    assert @seat.valid?
  end

  test "train should be present" do
    @seat.train = ""
    assert_not @seat.valid?
  end

  test "train should be included in valid options" do
    @seat.train = "InvalidTrain"
    assert_not @seat.valid?
  end

  test "wagons should be present and >= 1" do
    @seat.wagons = 0
    assert_not @seat.valid?
  end

  test "current_wagon should be present and >= 1" do
    @seat.current_wagon = 0
    assert_not @seat.valid?
  end

  test "seat_number should be present and >= 1" do
    @seat.seat_number = 0
    assert_not @seat.valid?
  end

  test "floor should be present and valid" do
    @seat.floor = 2
    assert_not @seat.valid?
  end

  test "should not save invalid seat" do
    invalid_seat = seats(:invalid)
    assert_not invalid_seat.save
  end
end
