class AddSenderNameAndReceiverNameToTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :sender_name, :string, default: ""
    add_column :transfers, :receiver_name, :string, default: ""
  end
end
