require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    post users_url, params: {
      user: {
        email: "test@example.com",
        username: "testuser",
        password: "password",
        password_confirmation: "password"
      }
    }

    assert_response :redirect
    assert_redirected_to family_url
  end
end
