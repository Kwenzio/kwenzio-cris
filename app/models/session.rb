class Session < ApplicationRecord
  SESSION_DURATION = 24.hours

  belongs_to :user

  before_create :set_expiration

  scope :active, -> { where("expires_at > ?", Time.current) }

  private
    def set_expiration
      self.expires_at ||= SESSION_DURATION.from_now
    end
end
