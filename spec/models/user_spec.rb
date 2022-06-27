require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a new user' do
    before do
      @user = create(:user)
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
      expect(User.count).to eq 1
    end
  end
end
