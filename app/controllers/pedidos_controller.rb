class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show edit update destroy]

  def index
    @pedidos = Pedido.includes(:cliente).order(created_at: :desc)
  end

  def show
  end

  def new
    @pedido = Pedido.new
    @pedido.item_pedidos.build
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.numero ||= Time.now.to_i.to_s.last(4)

    if @pedido.save
      processar_baixa_estoque(@pedido)
      redirect_to @pedido, notice: "Pedido ##{@pedido.numero} criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # 1. Devolve o estoque dos itens antigos antes de atualizar
    estornar_estoque(@pedido)

    if @pedido.update(pedido_params)
      # 2. Re-aplica a baixa de estoque com os novos itens/quantidades
      processar_baixa_estoque(@pedido)
      redirect_to @pedido, notice: "Pedido ##{@pedido.numero} atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    estornar_estoque(@pedido)
    @pedido.destroy
    redirect_to pedidos_path, notice: "Pedido removido e estoque devolvido com sucesso."
  end

  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def pedido_params
    params.require(:pedido).permit(:cliente_id, :status, item_pedidos_attributes: [:id, :produto_id, :quantidade, :preco_unitario, :_destroy])
  end

  def processar_baixa_estoque(pedido)
    pedido.item_pedidos.each do |item|
      produto = item.produto
      if produto
        produto.update(quantidade: produto.quantidade - item.quantidade)
      end
    end
  end

  def estornar_estoque(pedido)
    pedido.item_pedidos.each do |item|
      produto = item.produto
      if produto
        produto.update(quantidade: produto.quantidade + item.quantidade)
      end
    end
  end
end