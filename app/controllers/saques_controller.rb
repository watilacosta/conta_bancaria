# == Schema Information
#
# Table name: saques
#
#  id         :bigint           not null, primary key
#  valor      :decimal(, )
#  conta_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SaquesController < ApplicationController
  before_action :set_saque, only: [:show]

  def show
  end

  def new
    @saque = Saque.new
  end

  def create
    @saque = Saque.new(saque_params)

    respond_to do |format|
      if @saque.save
        format.html { redirect_to conta_path(@saque.conta), notice: 'Saque realizado com sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_saque
    @saque = Saque.find(params[:id])
  end

  def saque_params
    params.require(:saque).permit(:valor, :conta_id)
  end
end
