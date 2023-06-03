require 'rails_helper'

RSpec.describe GroupPayment, type: :model do
  describe 'associations' do
    it 'belongs to a group' do
      grouppayment = GroupPayment.reflect_on_association(:group)
      expect(grouppayment.macro).to eq(:belongs_to)
    end

    it 'belongs to a payment' do
      grouppayment = GroupPayment.reflect_on_association(:payment)
      expect(grouppayment.macro).to eq(:belongs_to)
    end
  end
end
