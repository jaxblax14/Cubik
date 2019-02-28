require 'test_helper'

class ShowUnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get unit_1" do
    get show_units_unit_1_url
    assert_response :success
  end

  test "should get unit_2" do
    get show_units_unit_2_url
    assert_response :success
  end

  test "should get unit_3" do
    get show_units_unit_3_url
    assert_response :success
  end

  test "should get unit_4" do
    get show_units_unit_4_url
    assert_response :success
  end

  test "should get unit_5" do
    get show_units_unit_5_url
    assert_response :success
  end

  test "should get ending" do
    get show_units_ending_url
    assert_response :success
  end

end
