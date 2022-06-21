class Authentication::SessionsController < ApplicationController
  skip_before_action :protect_pages

  def new
  end

  def create
    @user = User.find_by("email = :login OR username = :login", { login: params[:login] })

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to products_path, notice: t('.created')
    else
      redirect_to new_session_path, alert: t('.failed')
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to products_path, notice: t('.destroyed')
  end
end
