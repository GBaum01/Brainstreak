require "test_helper"

class FamilyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    user = User.create!(
      email: "family_test@example.com",
      username: "familyuser",
      password: "password",
      password_confirmation: "password"
    )

    post session_url, params: { login: user.email, password: "password" }
    get family_url

    assert_response :success
  end
end
