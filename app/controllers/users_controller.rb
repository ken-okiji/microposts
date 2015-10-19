class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def edit
  end

  def update
    if @user.update(user_params)
      #保存に成功した場合はメッセージを出してエディットページ表示
      flash.now[:success] = "ユーザー情報を編集しました。"
      render 'edit'
    else
      #保存に失敗した場合はメッセージを出してエディットページ表示
      flash.now[:alert] = "ユーザー情報の保存に失敗しました。"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts #ユーザーの全投稿を代入
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
    params.require(:user).permit(:name, :email, :password, :area, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end