class Asset < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :ticker, presence: true
end
