# frozen_string_literal: true

class UsersController < ApplicationController
  include FlashHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to start_path
      flash[:notice] = "Здравствуйте, #{current_user.name}!"
    else
      flash[:error] = 'Ошибка при вводе данных'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
  end
end
