class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #redirect_to user_path(@user) と同じ動作
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    #params[:user]のパラメータで name,email,password,password_confirmationのみを許可する。
    #返り値は {name: "入力されたname", email: "入力されたemail", password: "入力されたpassword", password_confirmation: "入力されたpassword_confirmation"}
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
