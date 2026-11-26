require "test_helper"

module ApplicationCable
  class ConnectionTest < ActionCable::Connection::TestCase
    test "connects with an active session" do
      session = users(:one).sessions.create!
      cookies.signed[:session_id] = session.id

      connect

      assert_equal users(:one), connection.current_user
    end

    test "rejects an expired session" do
      session = users(:one).sessions.create!
      cookies.signed[:session_id] = session.id
      travel 25.hours

      assert_reject_connection { connect }
    end
  end
end
