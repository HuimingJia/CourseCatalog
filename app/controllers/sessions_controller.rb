class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(account: params[:session][:account].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      flash[:success] = 'welcome to CourseCatalog!'
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end


end
