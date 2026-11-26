require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "downcases and strips email_address" do
    user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal("downcased@example.com", user.email_address)
  end

  test "hashes passwords with bcrypt" do
    user = User.new(password: "password")

    assert_match(/\A\$2[aby]\$/, user.password_digest)
    assert user.authenticate("password")
  end
end
