# == Schema Information
#
# Table name: contas
#
#  id         :bigint           not null, primary key
#  cliente_id :bigint           not null
#  saldo      :decimal(, )      default(0.0)
#  agencia    :string           default("100")
#  numero     :string           default("0001")
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class ContasController < ApplicationController
  before_action :set_conta, only: [:show, :edit, :update]
  skip_before_action :authenticate_cliente!, only: [:new, :create]

  def show
  end

  def new
    @conta = Conta.new
  end

  def edit
  end

  def create
    @conta = Conta.new(conta_params)

    respond_to do |format|
      if @conta.save
        format.html { redirect_to @conta, notice: 'Conta was successfully created.' }
        format.json { render :show, status: :created, location: @conta }
      else
        format.html { render :new }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @conta.update(conta_params)
        msg = @conta.encerrar? ? 'Conta encerrada com sucesso!' : 'Selecione a opção encerrar'
        format.html { redirect_to @conta, notice: msg }
        format.json { render :show, status: :ok, location: @conta }
      else
        format.html { render :edit }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_conta
    @conta = Conta.find(params[:id])
  end

  def conta_params
    params.require(:conta).permit(:cliente_id, :saldo, :agencia, :numero, :status)
  end
end
