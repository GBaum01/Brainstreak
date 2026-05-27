require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    user = User.create!(
      email: "session_test@example.com",
      username: "sessionuser",
      password: "password",
      password_confirmation: "password"
    )

    post session_url, params: { login: user.email, password: "password" }
    assert_response :redirect
    assert_redirected_to family_url
  end

  test "should destroy session" do
    delete session_url
    assert_response :redirect
    assert_redirected_to root_url
  end
end
