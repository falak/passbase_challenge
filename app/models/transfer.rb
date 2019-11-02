class Transfer < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => "transfers_users"
  has_and_belongs_to_many :accounts, :join_table => "accounts_transfers"
  def process_transaction sender,params
    ActiveRecord::Base.transaction do
        receiver = User.find params[:user_id].to_i
        sender_account = sender.accounts.find_by currency_type: params[:currency].downcase
        receiver_account = receiver.accounts.find_by currency_type: params[:currency].downcase
        old_balance = sender_account.balance
        new_balance = sender_account.balance - params[:transfer][:value].to_f
        sender_account.balance = new_balance
        sender_account.save!
        receiver_account.balance += params[:transfer][:value].to_f
        t1=Transfer.create!(value: params[:transfer][:value].to_f, transaction_status: true)
        sender.transfers << t1
        sender_account.transfers << t1
        receiver.transfers << t1
        receiver_account.transfers << t1
        receiver_account.save!
        self.errors.add(:base, "Transfer unsuccessful because of insufficent funds") if old_balance < params[:transfer][:value].to_f
        raise ActiveRecord::Rollback if old_balance < params[:transfer][:value].to_f
    end
  end
  def convert_currency
  end
end
