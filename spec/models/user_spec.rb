require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:nickname) }
  it { should validate_uniqueness_of(:nickname) }
  it { should have_many(:posts) }
  it { should have_and_belong_to_many(:followers).class_name('User') }
  it { should have_and_belong_to_many(:followed_users).class_name('User') }

  context 'with valid attributes' do
    it 'is valid with a unique nickname' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid with a duplicate nickname' do
      create(:user, nickname: "duplicate_nickname")
      user = build(:user, nickname: "duplicate_nickname")
      expect(user).not_to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      expect(user).not_to be_valid
    end
  end
end
