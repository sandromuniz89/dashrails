class FinanceiroController < ApplicationController
  def index
    @lancamentos = Lancamento.order(data: :desc, created_at: :desc)
    @total_receitas = Lancamento.where(tipo: 'receita').sum(:valor)
    @total_despesas = Lancamento.where(tipo: 'despesa').sum(:valor)
    @saldo_total = @total_receitas - @total_despesas
  end

  def new
    @lancamento = Lancamento.new
  end

  def create
    @lancamento = Lancamento.new(lancamento_params)

    if @lancamento.save
      redirect_to financeiro_index_path, notice: "Lançamento financeiro registrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lancamento = Lancamento.find(params[:id])
    @lancamento.destroy
    redirect_to financeiro_index_path, notice: "Lançamento removido com sucesso."
  end

  private

  def lancamento_params
    params.require(:lancamento).permit(:descricao, :valor, :tipo, :data, :categoria)
  end
end