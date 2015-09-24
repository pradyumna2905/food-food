class LoginsController < ApplicationController

  def new

  end

  def create
    chef = Chef.find_by(email: params[:email])

    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "Log in successful"
      redirect_to recipes_path
      session[:chef_id]
    else
      flash.now[:danger] = "Oops! Looks like your information does not match our records"
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    flash[:success] = "Log out successful"
    redirect_to root_path
  end

end
