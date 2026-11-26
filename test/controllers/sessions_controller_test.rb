require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = User.take }

  test "new" do
    get login_path
    assert_response :success
  end

  test "create with valid credentials" do
    delete logout_path
    post login_path, params: { email_address: @user.email_address, password: "password" }

    assert_redirected_to logout_path
    assert cookies[:session_id]

    session = @user.sessions.last
    assert_in_delta 24.hours.from_now, session.expires_at, 1.second
    cookie = response.headers["Set-Cookie"].find { |value| value.start_with?("session_id=") }
    expires = cookie[/expires=([^;]+)/i, 1]
    assert_equal session.expires_at.to_i, Time.httpdate(expires).to_i
  end

  test "create with invalid credentials" do
    post login_path, params: { email_address: @user.email_address, password: "wrong" }

    assert_redirected_to login_path
    assert_nil cookies[:session_id]
  end

  test "destroy" do
    sign_in_as(@user)

    delete logout_path

    assert_redirected_to login_path
    assert_empty cookies[:session_id]
  end

  test "expired session cannot be resumed" do
    sign_in_as(@user)
    session = Current.session
    travel 25.hours

    delete logout_path

    assert_redirected_to login_path
    assert Session.exists?(session.id)
  end
end
