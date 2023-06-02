require 'rails_helper'

RSpec.feature 'Group Index', type: :feature do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers
  before(:each) do
    @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123',
                        password_confirmation: 'aleem123')
    sign_in @user
    visit user_groups_path(@user)
  end

  describe 'Group Index Page' do
    it 'displays the page title' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'displays correct category name' do
      expect(page).to have_content('Category')
    end

    it 'displays a link to add a new category' do
      expect(page).to have_link('Add A New Category')
    end
  end
end
