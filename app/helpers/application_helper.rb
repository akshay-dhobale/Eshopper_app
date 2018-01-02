module ApplicationHelper

  def cart_count
    if current_user.present?
      @count = Cart.where(user_id: current_user.id).count()
      return @count
    end
  end

end
