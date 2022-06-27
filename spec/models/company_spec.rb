require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'when creating a new company' do
    before do
      @company = create(:company)
    end

    it "is valid with valid attributes" do
      expect(@company).to be_valid
      expect(Company.count).to eq 1
    end
  end
end
