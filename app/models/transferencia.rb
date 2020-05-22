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
class Transferencia < ApplicationRecord
  belongs_to :conta_origem, class_name: "Conta"
  belongs_to :conta_destino, class_name: "Conta"

  before_save :transferir

  validates :conta_origem, :conta_destino, :valor, presence: true
  validates :valor, numericality: { greater_than: 0 }

  def transferir
    ActiveRecord::Base.transaction do
      taxa_transferencia
      valida_saldo_suficiente

      self.conta_destino.saldo += self.valor
      self.conta_destino.save!
      self.conta_origem.saldo -= (self.valor + self.taxa)
      self.conta_origem.save!
    end
  end

  private

  # Taxa de transferência:
  # De segunda a sexta das 9 às 18 horas a taxa é 5 reais por transferência
  # Fora desse horário a taxa é 7 reais
  # Acima de 1000 reais há um adicional de 10 reais na taxa
  def taxa_transferencia
    self.taxa = 0
    hora_util = DateTime.now.hour >= 9 and DateTime.now.hour <= 18
    dia_util  = DateTime.now.wday < 6 and DateTime.now.wday > 0

    if hora_util and dia_util
      self.taxa = 5
    else
      self.taxa = 7
    end

    self.taxa += 10 if self.valor > 1000
  end

  # Refatorar esse método e levá-lo para Model Conta
  def valida_saldo_suficiente
    unless self.conta_origem.saldo >= self.valor + self.taxa
      errors.add(:valor, 'Saldo insuficiente!')
      return
    end
  end
end
