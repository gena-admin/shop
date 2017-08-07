require 'rails_helper'

describe Item, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end
end
