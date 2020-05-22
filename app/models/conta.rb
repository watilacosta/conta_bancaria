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
class Conta < ApplicationRecord
  belongs_to :cliente, dependent: :destroy, optional: true
  
  acts_as_paranoid

  after_update :encerrar

  validates :saldo, numericality: { greater_than_or_equal_to: 0 }
  validates :agencia, :numero, :status, presence: true


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

  def extrato dt_inicial, dt_final
    if dt_inicial.present? and dt_final.present?
      @extratos = []
      @extratos << Deposito.where(created_at: dt_inicial.to_date.beginning_of_day..dt_final.to_date.end_of_day, numero_conta: self.numero)
                           .order(created_at: :asc)
      @extratos << Saque.where(created_at: dt_inicial.to_date.beginning_of_day..dt_final.to_date.end_of_day, conta: self)
                        .order(created_at: :asc)
      @extratos << Transferencia.where(created_at: dt_inicial.to_date.beginning_of_day..dt_final.to_date.end_of_day, conta_origem: self)
                                .order(created_at: :asc)
      @extratos.flatten!
    end
  end
end
