class SessionsController < ApplicationController
  def new
  end


  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:return_to] || root_path, notice: "Здравствуйте, #{current_user.name}! Хорошей работы."
    else
      flash[:alert] = "Введите Ваш email и пароль"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to start_path
  end

end
