require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.create(name: 'Muhammad Aleem', email: 'aleem123@gmail.com', password: 'aleem123', password_confirmation: 'aleem123')
  end
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      payment = Payment.new(name: 'Rent', amount: 100, author_id: @user.id)
      expect(payment).to be_valid
    end

    it 'is not valid without a name' do
      payment = Payment.new(amount: 100)
      expect(payment).not_to be_valid
    end

    it 'is not valid without an amount' do
      payment = Payment.new(name: 'Rent')
      expect(payment).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      payment = Payment.reflect_on_association(:author)
      expect(payment.macro).to eq(:belongs_to)
    end

    it 'has many groups' do
      payment = Payment.reflect_on_association(:groups)
      expect(payment.macro).to eq(:has_many)
    end
  end
end
