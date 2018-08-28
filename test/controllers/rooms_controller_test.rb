require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get makerspace" do
    get rooms_makerspace_url
    assert_response :success
  end

  test "should get makerlab119" do
    get rooms_makerlab119_url
    assert_response :success
  end

  test "should get makerlab121" do
    get rooms_makerlab121_url
    assert_response :success
  end

  test "should get mill1" do
    get rooms_mill1_url
    assert_response :success
  end

  test "should get lathe1" do
    get rooms_lathe1_url
    assert_response :success
  end

  test "should get lathe2" do
    get rooms_lathe2_url
    assert_response :success
  end

  test "should get welding1" do
    get rooms_welding1_url
    assert_response :success
  end

  test "should get welding2" do
    get rooms_welding2_url
    assert_response :success
  end

  test "should get sandbox" do
    get rooms_sandbox_url
    assert_response :success
  end

  test "should get trailer" do
    get rooms_trailer_url
    assert_response :success
  end

end
