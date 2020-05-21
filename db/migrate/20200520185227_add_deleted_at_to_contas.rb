class AddDeletedAtToContas < ActiveRecord::Migration[6.0]
  def change
    add_column :contas, :deleted_at, :datetime
    add_index :contas, :deleted_at
  end
end
