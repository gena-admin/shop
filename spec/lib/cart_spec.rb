require 'rails_helper'

describe Cart do
  let(:session) do
    {
       cart: {
           '1' => 1,
           '4' => 4
       }
    }
  end

  subject { Cart.new(session) }

  describe '#add_item_to_cart' do
    it 'should add new product to cart' do
      subject.add_item_to_cart('7')

      expect(session).to eql(
         {
           cart: {
             '1' => 1,
             '4' => 4,
             '7' => 1
            }
        }
      )
    end

    it 'should increase count of product into cart' do
      subject.add_item_to_cart('1')

      expect(session).to eql(
       {
         cart: {
           '1' => 2,
           '4' => 4
         }
        }
      )
    end
  end

  describe '#remove_item_from_cart' do
    it 'should decrease count of product into cart' do
      subject.remove_item_from_cart('4')

      expect(session).to eql(
       {
         cart: {
           '1' => 1,
           '4' => 3
         }
        }
      )
    end
  end

  describe '#remove_product_from_cart' do
    it 'should remove product from cart' do
      subject.remove_product_from_cart('4')

      expect(session).to eql(
       {
         cart: {
           '1' => 1
         }
        }
      )
    end
  end

  describe '#clear' do
    it 'should clear cart' do
      subject.clear

      expect(session).to eql({ cart: nil })
    end
  end

  describe '#total_items' do
    it 'should return total items count' do
      expect(subject.total_items).to eql(5)
    end
  end

  describe '#items_for_order' do
    it 'should return items_for_order' do
      expect(subject.items_for_order).to eql([
        {
          product_id: "1",
          quantity: 1
        },
        {
          product_id: "4",
          quantity: 4
        }
      ])
    end
  end
end
