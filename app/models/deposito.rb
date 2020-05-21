# == Schema Information
#
# Table name: depositos
#
#  id           :bigint           not null, primary key
#  valor        :decimal(, )
#  nome         :string
#  sobrenome    :string
#  cpf          :string
#  ddd          :string
#  telefone     :string
#  numero_conta :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Deposito < ApplicationRecord
  before_save :depositar

  validates :valor, numericality: { greater_than: 0 }, presence: true
  validates :nome, 
            :sobrenome, 
            :cpf, 
            :ddd, 
            :telefone, 
            :numero_conta, presence: true
  
  validate :conta_existe

  def depositar
    ActiveRecord::Base.transaction do
      conta = Conta.find_by(numero: self.numero_conta)
      conta.saldo += self.valor
      conta.save!
    end
  end

  private

  def conta_existe
    conta = Conta.find_by(numero: self.numero_conta)
    unless conta
      errors.add(:numero_conta, 'Esta conta não existe.')
    end
  end
end
