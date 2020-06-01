class UserController < ApplicationController
  def user_description
    @user = User.find(params[:user_id].to_i)
  end
end
