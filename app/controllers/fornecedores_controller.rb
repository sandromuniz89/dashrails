class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: %i[show edit update destroy]

  def index
    @fornecedores = Fornecedor.order(created_at: :desc)
  end

  def show
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      redirect_to fornecedore_path(@fornecedor), notice: "Fornecedor cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @fornecedor.update(fornecedor_params)
      redirect_to fornecedore_path(@fornecedor), notice: "Fornecedor atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fornecedor.destroy
    redirect_to fornecedores_path, notice: "Fornecedor removido com sucesso."
  end

  private

  def set_fornecedor
    @fornecedor = Fornecedor.find(params[:id])
  end

  def fornecedor_params
    params.require(:fornecedor).permit(:nome, :contato, :categorias, :prazo_entrega, :forma_pagamento)
  end
end