class Account < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :transfers, :join_table => "accounts_transfers"
  def currency_with_balance
    "#{currency_type} , #{balance}"
  end
end
