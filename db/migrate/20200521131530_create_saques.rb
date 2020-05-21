class CreateSaques < ActiveRecord::Migration[6.0]
  def change
    create_table :saques do |t|
      t.decimal :valor
      t.references :conta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
