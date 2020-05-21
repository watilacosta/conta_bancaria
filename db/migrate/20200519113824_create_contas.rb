class CreateContas < ActiveRecord::Migration[6.0]
  def change
    create_table :contas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.decimal :saldo, default: 0
      t.string :agencia, default: '100'
      t.string :numero, default: '0001'
      t.integer :status

      t.timestamps
    end
  end
end
