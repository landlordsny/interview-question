class Message < ActiveRecord::Base
  belongs_to :user

  scope :unread, -> { where read_at: nil }

  def author
    user
  end

end
