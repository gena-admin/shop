FactoryGirl.define do
  factory :product do
    name { FFaker::Product.product_name }
    brand { FFaker::Product.brand }
    model { FFaker::Product.model }
    sku { FFaker.numerify('############') }
    price { rand(10000) }
  end
end
