class AddExpiresAtToSessions < ActiveRecord::Migration[8.1]
  def up
    add_column :sessions, :expires_at, :datetime
    execute "UPDATE sessions SET expires_at = created_at + INTERVAL '24 hours'"
    change_column_null :sessions, :expires_at, false
  end

  def down
    remove_column :sessions, :expires_at
  end
end
