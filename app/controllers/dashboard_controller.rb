class DashboardController < ApplicationController
  def index
    # Métricas Gerais
    @total_produtos = Produto.count
    @total_pedidos = Pedido.count
    @total_clientes = Cliente.count
    @total_vendas = Pedido.sum(:total)

    # Financeiro
    @total_receitas = Lancamento.where(tipo: 'receita').sum(:valor)
    @total_despesas = Lancamento.where(tipo: 'despesa').sum(:valor)
    @saldo_financeiro = @total_receitas - @total_despesas

    # Tabelas do Resumo
    @ultimos_pedidos = Pedido.order(created_at: :desc).limit(5)
    @produtos_estoque_baixo = Produto.where("quantidade < ?", 10).order(:quantidade)
  end
end