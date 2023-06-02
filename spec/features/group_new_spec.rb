require 'rails_helper'

RSpec.feature 'Group New Page', type: :feature do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  before(:each) do
    @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123',
                        password_confirmation: 'aleem123')
    sign_in @user
    visit new_user_group_path(@user)
  end

  describe 'Add new category' do
    it 'displays the page title' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'displays a button to add a new category' do
      expect(page).to have_button('Save Category')
    end
  end
end
