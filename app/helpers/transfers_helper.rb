module TransfersHelper
  def receiver_names
    User.where.not(id: current_user.id).all
  end
end
