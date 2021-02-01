require "test_helper"

class MiniUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mini_user = mini_users(:one)
  end

  test "should get index" do
    get mini_users_url
    assert_response :success
  end

  test "should get new" do
    get new_mini_user_url
    assert_response :success
  end

  test "should create mini_user" do
    assert_difference('MiniUser.count') do
      post mini_users_url, params: { mini_user: { avatar_url: @mini_user.avatar_url, country: @mini_user.country, gender: @mini_user.gender, nick_name: @mini_user.nick_name, open_id: @mini_user.open_id, province: @mini_user.province, unionid: @mini_user.unionid } }
    end

    assert_redirected_to mini_user_url(MiniUser.last)
  end

  test "should show mini_user" do
    get mini_user_url(@mini_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_mini_user_url(@mini_user)
    assert_response :success
  end

  test "should update mini_user" do
    patch mini_user_url(@mini_user), params: { mini_user: { avatar_url: @mini_user.avatar_url, country: @mini_user.country, gender: @mini_user.gender, nick_name: @mini_user.nick_name, open_id: @mini_user.open_id, province: @mini_user.province, unionid: @mini_user.unionid } }
    assert_redirected_to mini_user_url(@mini_user)
  end

  test "should destroy mini_user" do
    assert_difference('MiniUser.count', -1) do
      delete mini_user_url(@mini_user)
    end

    assert_redirected_to mini_users_url
  end
end
