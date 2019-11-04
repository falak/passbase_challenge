class Transfer < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => "transfers_users"
  has_and_belongs_to_many :accounts, :join_table => "accounts_transfers"
  def process_transaction sender,params
    ActiveRecord::Base.transaction do
      receiver = User.find params[:transfer][:receiver_name].to_i
      sender_account = sender.accounts.find params[:sender_account_id]
      receiver_account = receiver.accounts.find_by currency_type: params[:receiver_currency_type].downcase
      amount = process_currency(sender_account,receiver_account,params[:transfer][:value].to_f)
      old_balance = sender_account.balance
      new_balance = sender_account.balance - params[:transfer][:value].to_f
      sender_account.balance = new_balance
      sender_account.save!
      receiver_account.balance += amount
      t1=Transfer.create!(value: params[:transfer][:value].to_f, transaction_status: true,sender_name: params[:transfer][:sender_name],receiver_name: receiver.name,currency_type: sender_account.currency_type)
      t2=Transfer.create!(value: amount, transaction_status: true,sender_name: params[:transfer][:sender_name],receiver_name: receiver.name,currency_type: receiver_account.currency_type)
      sender.transfers << t1
      sender_account.transfers << t1
      receiver.transfers << t2
      receiver_account.transfers << t2
      receiver_account.save!
      self.errors.add(:base, "Transfer unsuccessful because of insufficent funds") if old_balance < params[:transfer][:value].to_f
      raise ActiveRecord::Rollback if old_balance < params[:transfer][:value].to_f
    end
  end
  def process_currency sender_account, receiver_account, value
    if sender_account.currency_type == 'usd' && receiver_account.currency_type == 'gbp'
      return value * 0.77
    elsif sender_account.currency_type == 'usd' && receiver_account.currency_type == 'euro'
      return value * 0.90
    elsif sender_account.currency_type == 'euro' && receiver_account.currency_type == 'gbp'
      return value * 0.86
    elsif sender_account.currency_type == 'gbp' && receiver_account.currency_type == 'euro'
      return value * 1.16
    else
      return value
    end
  end
end
