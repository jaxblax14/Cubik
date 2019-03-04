require 'test_helper'

class WizzarBlocklyControllerTest < ActionDispatch::IntegrationTest
  test "should get tutorial" do
    get wizzar_blockly_tutorial_url
    assert_response :success
  end

end
