require 'test_helper'

class ChallengeIntroControllerTest < ActionDispatch::IntegrationTest
  test "should get intro" do
    get challenge_intro_intro_url
    assert_response :success
  end

end
