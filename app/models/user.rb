class User < ActiveRecord::Base
  has_many :messages

  def self.with_read_message
    all.select(&:message?)
  end

  def message?
    messages.where('read_at < ?', Time.current).any?
  end
end
