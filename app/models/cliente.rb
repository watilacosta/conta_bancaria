# == Schema Information
#
# Table name: clientes
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  tipo                   :integer
#  cpf                    :string
#  cnpj                   :string
#  nome                   :string
#  razão_social           :string
#  endereco               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#
class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  acts_as_paranoid

  has_one :conta
  has_many :depositos

  enum tipo: {
    fisica: 0,
    juridica: 1
  }

  validates :tipo, :nome, :cpf, :endereco, presence: true, if: :fisica?
  validates :tipo, :razão_social, :cnpj, :endereco, presence: true, if: :juridica?
  validates :endereco, length: { maximum: 200 }
end
