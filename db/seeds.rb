# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1=User.create email: 'user_a@fast.com', password: 'abc123', password_confirmation: 'abc123',name: 'User A'
t1=Transfer.create value: 1000.0, transaction_status: true
a1 = Account.create balance: 1000.0, user_id: u1.id, currency_type: 'usd'
Account.create balance: 0.0, user_id: u1.id, currency_type: 'euro'
Account.create balance: 0.0, user_id: u1.id, currency_type: 'gbp'
u1.transfers << t1
a1.transfers << t1


u2=User.create email: 'user_b@fast.com', password: 'abc123', password_confirmation: 'abc123',name: 'User B'
t2=Transfer.create value: 1000.0, transaction_status: true
a2=Account.create balance: 1000.0, user_id: u2.id, currency_type: 'usd'
Account.create balance: 0.0, user_id: u2.id, currency_type: 'euro'
Account.create balance: 0.0, user_id: u2.id, currency_type: 'gbp'
u2.transfers << t2
a2.transfers << t2