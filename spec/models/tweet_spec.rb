require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'when creating a new Tweet' do
    before do
      @tweet = create(:tweet)
    end

    it "is valid with valid attributes" do
      expect(@tweet).to be_valid
      expect(Tweet.count).to eq 1
    end
  end
end
