class SessionsController < ApplicationController
  
  def create
    github_authenticate!
    @user = User.find_or_create(login: github_user.name, email: github_user.email, id: github_user.id)
    redirect_to root_url
  end
  
  def destroy
    github_logout
    redirect_to root_url
  end
end
