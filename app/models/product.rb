class Product < ApplicationRecord
  enum :category, [:toys, :electronics, :food]
end
