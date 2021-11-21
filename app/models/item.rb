class Item < ApplicationRecord
  has_many :genre
  attachment :image
end
