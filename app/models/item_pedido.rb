class ItemPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  before_save :capturar_preco

  def subtotal
    (quantidade || 0) * (preco_unitario || 0)
  end

  private

  def capturar_preco
    self.preco_unitario ||= produto&.preco_venda
  end
end