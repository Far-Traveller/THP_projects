class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by(email: params[:login_email])
    if user && user.authenticate(post_params[:password])
      session[:user_id] = user.id
      flash.now[:success] = 'Super, tu es connecté !'
      redirect_to gossips_path
    else
      flash.now[:danger] = 'Email ou/et mot de passe erroné(s)'
      render 'new'
    end
  end

  def create
    @current_user = User.find_by(email: session_params[:email])
    if @current_user && @current_user.authenticate(session_params[:password])
      log_in(@current_user)
      flash[:success] = 'Bienvenue mon pote !'
      redirect_to gossips_path
    else
      flash[:danger] = 'Email ou/et mot de passe erroné(s)'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to gossips_path
  end

  private

  def session_params # récupère les params
    session_params = params.require(:session).permit(:email, :password)
  end
end
