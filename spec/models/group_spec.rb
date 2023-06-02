require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123', password_confirmation: 'aleem123')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      group = Group.new(name: 'Family', author_id: @user.id)
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group = Group.new
      expect(group).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      group = Group.reflect_on_association(:author)
      expect(group.macro).to eq(:belongs_to)
    end

    it 'has many payments' do
      group = Group.reflect_on_association(:payments)
      expect(group.macro).to eq(:has_many)
    end
  end
end
