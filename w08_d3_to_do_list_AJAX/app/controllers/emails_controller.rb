class EmailsController < ApplicationController

  def index
    @emails = Email.all
    @email = Email.new
  end

  def create
    @email =  Email.new(email_params)
    respond_to do |format|
      format.html {
        flash[:notice] = "Email created"
        redirect_to emails_path
      }
      format.js { }
    end
  end


  private

  def email_params
    params.permit(:object, :body)
  end


end
