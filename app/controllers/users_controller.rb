class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def nea_staff(current_user)
    n=[1,3]

    if n.include? current_user
      return true
    else
      return false


    end
  end





end
