require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "When User Login" do
    let!(:user) { create(:user) }
    let!(:user_to_follow) { create(:user) }

    before do
      sign_in user
    end

    describe "POST /subscribe" do
      it "subscribes to a user" do
        post subscribe_user_path(user_to_follow)
        expect(user.followed_users).to include(user_to_follow)
        expect(response).to redirect_to(pages_index_path) # Redirect to pages index
      end
    end

    describe "DELETE /unsubscribe" do
      before do
        user.followed_users << user_to_follow
      end

      it "unsubscribes from a user" do
        delete unsubscribe_user_path(user_to_follow)
        expect(user.followed_users).not_to include(user_to_follow)
        expect(response).to redirect_to(pages_index_path) # Redirect to pages index
      end
    end
  end
end
