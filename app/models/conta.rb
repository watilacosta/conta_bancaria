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
#
class Conta < ApplicationRecord
  belongs_to :cliente, dependent: :destroy, optional: true

  after_update :encerrar

  acts_as_paranoid

  enum status: {
    aberta: 0,
    encerrar: 1
  }

  def encerrar
    self.destroy if self.encerrar?
  end

  def depositos
    Deposito.find_by(numero_conta: self.numero)
  end
end
