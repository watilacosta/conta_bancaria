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
class Saque < ApplicationRecord
  belongs_to :conta

  before_save :sacar

  validates :valor, numericality: { greater_than: 0 }, presence: true
  validate :valida_saldo_suficiente
  validates :conta, presence: true

  def sacar
    ActiveRecord::Base.transaction do
      conta = self.conta
      conta.saldo -= self.valor 
      conta.save!
    end
  end

  private

  def valida_saldo_suficiente
    if self.conta and self.valor
      errors.add(:valor, 'Saldo insuficiente para este valor') unless self.conta.saldo >= self.valor
    end
  end
end
