class Transfer < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => "transfers_users"
  has_and_belongs_to_many :accounts, :join_table => "accounts_transfers"
end
