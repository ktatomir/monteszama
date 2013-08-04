class UsersController < ApplicationController
  def new
    github_authenticate!
    @user = User.new(login: github_user.name, email: github_user.email, id: github_user.id)
  end
  
  def create
    @user = User.find_or_create(params[:user])
    if @user
      redirect_to :root
    else
      flash[:notice] = @user
      render :new
    end
  end
end
