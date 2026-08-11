class Produto < ApplicationRecord
  has_many :item_pedidos
  has_many :pedidos, through: :item_pedidos
end