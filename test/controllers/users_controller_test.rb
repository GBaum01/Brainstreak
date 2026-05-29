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

  test "should get edit when logged in" do
    user = User.create!(
      email: "edit_test@example.com",
      username: "edituser",
      password: "password",
      password_confirmation: "password"
    )

    # Log in
    post session_url, params: { login: user.email, password: "password" }

    get edit_user_url(user)
    assert_response :success
  end

  test "should update user profile" do
    user = User.create!(
      email: "update_test@example.com",
      username: "updateuser",
      password: "password",
      password_confirmation: "password"
    )

    # Log in
    post session_url, params: { login: user.email, password: "password" }

    patch user_url(user), params: {
      user: {
        email: "new_email@example.com",
        username: "newusername",
        password: "",
        password_confirmation: ""
      }
    }

    assert_response :redirect
    assert_redirected_to family_url

    user.reload
    assert_equal "new_email@example.com", user.email
    assert_equal "newusername", user.username
  end
end
