require 'test_helper'

class ChallengeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get challenge_index_url
    assert_response :success
  end

end
