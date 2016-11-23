class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  protected

  def authenticate_user
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = User.find session[:user_id]
      true
    else
      redirect_to(controller: 'sessions', action: 'login')
      false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to(controller: 'sessions', action: 'home')
      false
    else
      true
    end
  end
end
