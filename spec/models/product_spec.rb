require 'rails_helper'

describe Product, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:items) }
  end

  context 'validations'do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:sku) }
    it { is_expected.to validate_uniqueness_of(:sku) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end
end
