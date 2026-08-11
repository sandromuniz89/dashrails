class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[show edit update destroy]

  def index
    @clientes = Cliente.order(created_at: :desc)
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to @cliente, notice: "Cliente cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cliente.update(cliente_params)
      redirect_to @cliente, notice: "Dados do cliente atualizados com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cliente.destroy
    redirect_to clientes_url, notice: "Cliente removido com sucesso."
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:nome, :empresa, :telefone, :email, :cidade, :estado)
  end
end