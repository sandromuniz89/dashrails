class Pedido < ApplicationRecord
  belongs_to :cliente, optional: true
  has_many :item_pedidos, dependent: :destroy
  has_many :produtos, through: :item_pedidos

  accepts_nested_attributes_for :item_pedidos, allow_destroy: true, reject_if: :all_blank

  before_validation :gerar_numero, on: :create
  before_save :calcular_total
  after_create :deduzir_estoque

  private

  def gerar_numero
    self.numero ||= (Pedido.maximum(:numero) || 1000) + 1
  end

  def calcular_total
    self.total = item_pedidos.sum { |item| (item.quantidade || 0) * (item.preco_unitario || 0) } + (valor_frete || 0)
  end

  def deduzir_estoque
    item_pedidos.each do |item|
      produto = item.produto
      next unless produto

      # Subtrai a quantidade vendida da quantidade atual no estoque
      nova_quantidade = [produto.quantidade.to_i - item.quantidade.to_i, 0].max
      produto.update(quantidade: nova_quantidade)
    end
  end
end