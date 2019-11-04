class AddCurrencyTypeToTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :currency_type, :string, default: ""
  end
end
