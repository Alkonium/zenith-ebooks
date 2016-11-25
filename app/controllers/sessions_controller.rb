class SessionsController < ApplicationController
  before_filter :authenticate_user, only: [:home, :profile, :setting]
  before_filter :save_login_state, only: [:login, :login_attempt]
  def login
    # Login Form
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are logged in as #{authorized_user.penName}"
      redirect_to(action: 'root')
    else
      flash[:notice] = 'Invalid Username or Password'
      flash[:color] = 'invalid'
      render 'login'
    end
end

  def home
  end

  def profile
  end

  def setting
  end

  def logout
    session[:user_id] = nil
    @order = Order.where(id: session[:order_id])
    if @order.status == 1
      @order.status = 3
    end
    session[:order_id] = nil
    redirect_to action: 'login'
  end
end
