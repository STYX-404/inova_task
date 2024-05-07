# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_without_username) { build(:user, username: nil) }
  let!(:user_without_duplicate_username) { create(:user, username: "test") }
  let(:valid_user) { build(:user) }

  describe 'validations' do
    context "when username is blank" do
      it 'fails' do
        expect(user_without_username.valid?).to be false
      end
    end

    context "when username is taken" do
      before do
        user_without_duplicate_username
      end
      it 'fails' do
        expect { user_without_duplicate_username }.to change{ User.count }.by(0)
      end
    end

    context "when user is valid" do
      it 'success' do
        expect(valid_user.valid?).to be true
      end
    end
  end
end
