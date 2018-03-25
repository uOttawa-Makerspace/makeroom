require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get makerspace" do
    get rooms_makerspace_url
    assert_response :success
  end

  test "should get makerlab" do
    get rooms_makerlab_url
    assert_response :success
  end

  test "should get makerlounge" do
    get rooms_makerlounge_url
    assert_response :success
  end

  test "should get brunsfield" do
    get rooms_brunsfield_url
    assert_response :success
  end

end
