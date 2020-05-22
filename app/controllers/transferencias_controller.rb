# == Schema Information
#
# Table name: transferencias
#
#  id               :bigint           not null, primary key
#  valor            :decimal(, )
#  conta_origem_id  :bigint
#  conta_destino_id :bigint
#  taxa             :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class TransferenciasController < ApplicationController
  before_action :set_transferencia, only: [:show]

  def show
  end

  def new
    @transferencia = Transferencia.new
    @conta         = current_cliente.conta
  end

  def create
    @transferencia = Transferencia.new(transferencia_params)

    respond_to do |format|
      if @transferencia.save
        format.html { redirect_to conta_path(current_cliente.conta), notice: 'Transferência realizada com sucesso!.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_transferencia
    @transferencia = Transferencia.find(params[:id])
  end

  def transferencia_params
    params.require(:transferencia).permit(:valor, :conta_origem_id, :conta_destino_id, :taxa)
  end
end
