require 'rails_helper'

RSpec.describe "Users", type: :request do

  RSpec.shared_context 'with multiple companies' do
    let!(:company_1) { create(:company) }
    let!(:company_2) { create(:company) }

    before do
      5.times do
        create(:user, company: company_1)
      end
      5.times do
        create(:user, company: company_2)
      end
    end
  end

  describe "#index" do
    let(:result) { JSON.parse(response.body) }

    context 'when fetching users by company' do
      include_context 'with multiple companies'

      it 'returns only the users for the specified company' do
        get company_users_path(company_1)

        expect(result.size).to eq(company_1.users.size)
        expect(result.map { |element| element['id'] } ).to eq(company_1.users.ids)
      end

      it 'filter by complete username' do
        username = company_1.users.first.username
        get company_users_path(company_1, params: {username: username})

        expect(result[0]['username']).to eq(username)
      end

      it 'filter by complete username' do
        create(:user, company: company_1, username: 'maria')
        create(:user, company: company_1, username: 'maria_eduarda')

        get company_users_path(company_1, params: {username: 'maria'})


        expect(result[0]['username']).to eq('maria')
        expect(result[1]['username']).to eq('maria_eduarda')
      end
    end

    context 'when fetching all users' do
      include_context 'with multiple companies'

      it 'returns all the users' do
        get users_path
        expect(result.size).to eq(User.all.size)
      end
    end
  end
end
