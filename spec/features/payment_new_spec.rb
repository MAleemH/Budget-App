require 'rails_helper'

RSpec.feature 'Payments New Page', type: :feature do
    include Devise::Test::IntegrationHelpers # Include Devise test helpers
    before(:each) do
        @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123', password_confirmation: 'aleem123')
        @group = Group.create(name: 'Group 1', icon: 'http://example.com', author_id: @user.id)
        sign_in @user
        visit new_user_group_payment_path(@user, @group)
    end

    describe 'Payments New' do
        it 'displays the page title' do
            expect(page).to have_content('NEW TRANSACTION')
        end
    end
end
  