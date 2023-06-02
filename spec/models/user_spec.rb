require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Muhammad Aleem', email: 'aleem@example.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'aleem@example.com', password: 'password')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Muhammad Aleem', password: 'password')
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'Muhammad Aleem', email: 'aleem@example.com')
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many payments' do
      user = User.reflect_on_association(:payments)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many groups' do
      user = User.reflect_on_association(:groups)
      expect(user.macro).to eq(:has_many)
    end
  end
end
