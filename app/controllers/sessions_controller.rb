class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:user)
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      log_in(user)
      remember(user)
      flash[:success] = "Hello #{user.first_name} !"
      redirect_to "/"
    else
      flash.now[:danger] = 'Email ou mot de passe invalide.'
      render :new
      end
  end

  def destroy
    log_out(current_user)
    flash[:danger] = 'Vous vous êtes déconnectés.'
    redirect_to "/"
  end
end
