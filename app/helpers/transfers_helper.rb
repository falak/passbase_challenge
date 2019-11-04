module TransfersHelper
  def receiver_names
    User.where.not(id: current_user.id).all
  end
  def sender_accounts_info
    current_user.accounts.all
  end
  def currency_with_balance
    "#{currency_type} , #{balance}"
  end
end
