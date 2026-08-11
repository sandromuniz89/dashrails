class Cliente < ApplicationRecord
  has_many :pedidos, dependent: :nullify
end