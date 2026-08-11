class RelatoriosController < ApplicationController
  def index
    # Filtro de Período
    @data_inicio = params[:data_inicio].presence ? Date.parse(params[:data_inicio]) : Date.today.beginning_of_month
    @data_fim = params[:data_fim].presence ? Date.parse(params[:data_fim]) : Date.today.end_of_month

    # 1. Totais Gerenciais
    pedidos_periodo = Pedido.where(created_at: @data_inicio.beginning_of_day..@data_fim.end_of_day)
    @faturamento = pedidos_periodo.sum(:total)
    
    lancamentos_periodo = Lancamento.where(data: @data_inicio..@data_fim)
    @receitas = lancamentos_periodo.where(tipo: 'receita').sum(:valor)
    @despesas = lancamentos_periodo.where(tipo: 'despesa').sum(:valor)
    @lucro_liquido = @receitas - @despesas

    # 2. Valorização do Estoque Atual (Obtém o valor do produto independente do nome do atributo)
    produtos = Produto.all
    @valor_estoque_venda = produtos.sum do |p| 
      preco_prod = p.try(:preco_venda) || p.try(:valor) || p.try(:preco) || 0
      (p.quantidade || 0) * preco_prod
    end
    
    @valor_estoque_custo = @valor_estoque_venda * 0.6
    @lucro_potencial_estoque = @valor_estoque_venda - @valor_estoque_custo

    # 3. Margem e Ponto de Equilíbrio
    @ticket_medio = pedidos_periodo.count.positive? ? (@faturamento / pedidos_periodo.count) : 0
    @pedidos_break_even = @ticket_medio.positive? ? (@despesas / @ticket_medio).ceil : 0

    # 4. Top Produtos Vendidos
    @top_produtos = ItemPedido.joins(:pedido)
                             .where(pedidos: { created_at: @data_inicio.beginning_of_day..@data_fim.end_of_day })
                             .joins(:produto)
                             .select("produtos.nome, SUM(item_pedidos.quantidade) as qtd_total, SUM(item_pedidos.quantidade * item_pedidos.preco_unitario) as receita_total")
                             .group("produtos.id, produtos.nome")
                             .order("qtd_total DESC")
                             .limit(5)

    # 5. Top Clientes
    @top_clientes = Pedido.where(created_at: @data_inicio.beginning_of_day..@data_fim.end_of_day)
                          .joins(:cliente)
                          .select("clientes.nome, COUNT(pedidos.id) as total_pedidos, SUM(pedidos.total) as total_comprado")
                          .group("clientes.id, clientes.nome")
                          .order("total_comprado DESC")
                          .limit(5)
  end
end