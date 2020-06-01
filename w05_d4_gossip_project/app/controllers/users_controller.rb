class UsersController < ApplicationController
  def show
    @user = User.find(params[:id].to_i)
  end

  def new
    @user = User.new
  end

  def create
    def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user)
        flash[:success] = 'Super ! Tu as crée ton profil :)'
        redirect_to gossips_path
      else
        render 'new'
      end
    end
  end


  private 

  def user_params
    user_params = params.require(:user).permit(:first_name, :last_name, :age, :description, :city, :email, :password, :password_confirmation)
    user_params[:city] = City.find(user_params[:city].to_i)
    return user_params
  end

end
