class Transfer < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => "transfers_users"
end
