class CreateJoinTableAccountTransfer < ActiveRecord::Migration[5.2]
  def change
    create_join_table :accounts, :transfers do |t|
      # t.index [:account_id, :transfer_id]
      # t.index [:transfer_id, :account_id]
    end
  end
end
