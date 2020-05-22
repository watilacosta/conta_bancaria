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
module ContasHelper

  def deposito_or_extrato extrato
    extrato.class == Deposito ? '' : 'red-text text-darken-2'
  end

  def sinal extrato
    extrato.class == Deposito ? '+' : '-'
  end

end
