class Product < ApplicationRecord
  include ProductImporter

  validates :name, presence: true

  validates :brand, presence: true

  validates :model, presence: true

  validates :sku, presence: true
  validates :sku, uniqueness: true

  validates :price, presence: true
  validates :price, numericality: true
end
