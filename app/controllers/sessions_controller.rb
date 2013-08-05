class SessionsController < ApplicationController
  
  def create
    github_authenticate!
    @user = User.find_or_create(login: github_user.name, email: github_user.email, id: github_user.id)
    if @user.save
      flash[:notice] = "Signed in as #{github_user.name}"
      redirect_to root_url
    else
      flash[:error] = "Unable to authorize, sorry :("
      github_logout
      redirect_to root_url
    end
  end
  
  def destroy
    github_logout
    redirect_to root_url
  end
end
