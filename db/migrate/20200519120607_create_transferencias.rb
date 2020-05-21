class CreateTransferencias < ActiveRecord::Migration[6.0]
  def change
    create_table :transferencias do |t|
      t.decimal :valor
      t.references :conta_origem
      t.references :conta_destino
      t.decimal :taxa

      t.timestamps
    end
  end
end
