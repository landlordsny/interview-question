require 'rails_helper'

describe User do
  it { should have_many(:messages) }

  describe "#message?" do
    it "returns false when user doesn't have message that has been read." do
      user = create(:user)

      expect(user.message?).to be false
    end

    it "returns true when user has message that has been read." do
      user = create(:user)
      create(:message, user: user, read_at: 1.day.ago)

      expect(user.message?).to be true
    end
  end

  describe ".with_read_message" do
    it "returns users who have message that has been read." do
      user = create(:user)
      create(:user)
      create(:message, user: user, read_at: 1.day.ago)

      expect(User.with_read_message).to eq [user]
    end
  end
end
