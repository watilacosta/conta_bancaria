class CreateDepositos < ActiveRecord::Migration[6.0]
  def change
    create_table :depositos do |t|
      t.decimal :valor
      t.string :nome
      t.string :sobrenome
      t.string :cpf
      t.string :ddd
      t.string :telefone
      t.string :numero_conta

      t.timestamps
    end
  end
end
