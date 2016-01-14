class UsersController < ApplicationController

  before_action :find_user, :only => [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @user = User.new
  end

  def create

  end

  def edit
    
  end

  def update
    @user.update(:sex => true) if update_params[:sex] == 'Man'
    @user.update(:sex => false) if update_params[:sex] == 'Lady'
    @user.update(:age => update_params[:age], :email => update_params[:email])
    @user.save
    redirect_to user_path(@user)
  end

  def destroy

  end 

  def login
    @user = User.find_by(:email => params[:inputEmail])
    if @user.authenticate(params[:inputPassword])
      self.current_user = @user
      redirect_to user_path(@user)
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:age, :email, :sex)
  end

  def login_params
    params.permit(:name, :password)
  end

end
