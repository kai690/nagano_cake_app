class Item < ApplicationRecord
  has_many :genres
  attachment :image
end
