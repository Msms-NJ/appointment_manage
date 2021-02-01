require "test_helper"

class Mini::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get mini_auth_login_url
    assert_response :success
  end
end
