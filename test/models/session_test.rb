require "test_helper"

class SessionTest < ActiveSupport::TestCase
  test "expires 24 hours after creation" do
    freeze_time do
      session = users(:one).sessions.create!

      assert_equal 24.hours.from_now, session.expires_at
    end
  end

  test "active excludes expired sessions" do
    session = users(:one).sessions.create!
    assert_includes Session.active, session

    travel 25.hours

    assert_not_includes Session.active, session
  end
end
