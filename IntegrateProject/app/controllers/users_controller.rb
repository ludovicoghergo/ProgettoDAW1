class UsersController < ApplicationController

  def index
    @userss = User.all
  end

  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:fname,:lname,:age,:sex,:username,:email,:city,:state,:zip))
    @user.save

    respond_to do |format|
    if @user.save
      flash[:notice] = "Saved successfully"
      format.html { render action: 'new' }
    else
      flash[:notice] = @user.errors.messages.first[1]
      format.html { render action: 'new' }
    end
  end
  end

  def show
    @user = User.find(params[:id])
  end
end
