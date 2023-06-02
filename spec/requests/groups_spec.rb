require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  before(:each) do
    @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123',
                        password_confirmation: 'aleem123')
    @group = Group.create(name: 'Group 1', icon: 'http://example.com', author_id: @user.id)
    @payment = Payment.create(name: 'Payment 1', amount: 100, author_id: @user.id)
    @group_payment = GroupPayment.create(payment_id: @payment.id, group_id: @group.id)
    sign_in @user
  end

  describe 'GET /groups' do
    it 'returns http success' do
      get user_groups_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_groups_path(user_id: @user.id)
      expect(response).to render_template('index')
    end

    it 'displays the group name' do
      get user_groups_path(user_id: @user.id)
      expect(response.body).to include('Group 1')
    end
  end
  describe 'GET /groups/new' do
    it 'returns http success' do
      get new_user_group_path(user_id: @user.id)
      expect(response).to have_http_status(200)
    end
    it 'renders the new template' do
      get new_user_group_path(user_id: @user.id)
      expect(response).to render_template('new')
    end
    it 'displays the new group form' do
      get new_user_group_path(user_id: @user.id)
      expect(response.body).to include('NEW CATEGORY')
    end
  end
end
