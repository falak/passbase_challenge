class Account < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :transfers, :join_table => "accounts_transfers"
end
