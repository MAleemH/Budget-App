require 'rails_helper'

RSpec.feature 'Payments Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  before(:each) do
    @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123',
                        password_confirmation: 'aleem123')
    @group = Group.create(name: 'Group 1', icon: 'http://example.com', author_id: @user.id)
    sign_in @user
    visit user_group_payments_path(@user, @group)
  end

  describe 'Payments Index' do
    it 'displays the page title' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'displays correct transactions name' do
      expect(page).to have_content('Transaction')
    end

    it 'displays correct transactions amount' do
      expect(page).to have_content('$0.0')
    end

    it 'displays a link to add a new transaction' do
      expect(page).to have_link('Add A New Transaction')
    end
  end
end
