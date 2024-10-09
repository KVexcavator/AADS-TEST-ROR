require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:body) }

  describe 'nested comments' do
    let(:post) { create(:post) }
    let(:user) { create(:user) }

    it 'allows comments on posts and replies to comments' do
      comment1 = post.comments.create(user: user, body: 'First comment')
      comment2 = comment1.children.create(user: user, body: 'Reply to first comment')

      expect(comment1.has_children?).to be true
      expect(comment2.parent).to eq(comment1)
    end
  end
end
