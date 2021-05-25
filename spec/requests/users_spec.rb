require 'rails_helper'

describe 'Users API', type: :request do
  # describe 'GET /test' do
  #   before do
  #     FactoryBot.create(:user, email: 'test@gmail.com', password: '123')
  #     FactoryBot.create(:user, email: 'test2@gmail.com', password: '123')
  #   end
  #
  #   it 'returns all users' do
  #     get '/test'
  #     expect(response).to have_http_status(:ok)
  #     expect(JSON.parse(response.body).size).to eq(2)
  #   end
  # end

  describe 'POST /users' do
    it 'create a new user' do
      expect {
        post '/users', params: { email: 'test@gmail.com', password: '123' }
      }.to change { User.count }.from(0).to(1)

      # post '/users', params: { email: 'test@gmail.com', password: '123' }

      expect(response).to have_http_status(:created)
    end
  end

  # describe 'DELETE /users' do
  #   it 'delete a user' do
  #     delete '/users',
  #   end
  # end

end