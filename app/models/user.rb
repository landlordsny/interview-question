class User < ActiveRecord::Base
  has_many :messages

  scope :with_read_message, -> { all.select(&:message?) }

  def message?
    messages.where('read_at < ?', Time.current).any?
  end
end
