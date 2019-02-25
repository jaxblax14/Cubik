require 'test_helper'

class UnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get units_new_url
    assert_response :success
  end

  test "should get index" do
    get units_index_url
    assert_response :success
  end

  test "should get edit" do
    get units_edit_url
    assert_response :success
  end

end
