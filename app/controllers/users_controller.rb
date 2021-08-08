class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /users
  def index
    if current_user.admin?
      @users = User.all
    elsif current_user.doctor?
      @users = User.where("role_id = ?", 2)
    elsif current_user.patient?
      @users = User.where("role_id = ?", 1)
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
  
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
  
    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully deleted." }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :name,
        :DOB,
        :role_id
      )
    end

    def needs_password?(_user, params)
      params[:password].present?
    end
end
