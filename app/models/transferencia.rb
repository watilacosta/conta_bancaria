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
end
