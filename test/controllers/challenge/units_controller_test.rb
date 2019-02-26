require 'test_helper'

class Challenge::UnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get assign" do
    get challenge_units_assign_url
    assert_response :success
  end

  test "should get edit" do
    get challenge_units_edit_url
    assert_response :success
  end

end
