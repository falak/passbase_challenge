class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.float :value
      t.boolean :transaction_status

      t.timestamps
    end
  end
end
