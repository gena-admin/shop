require 'rails_helper'

describe Order, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items) }
  end

  it { is_expected.to accept_nested_attributes_for(:items) }
end
