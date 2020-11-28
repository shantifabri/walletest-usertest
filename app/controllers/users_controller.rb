# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_permission, only: %i[edit update]
  before_action :require_admin, only: %i[index destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show; end

  # GET /users/1/edit
  def edit; end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def require_permission
    is_admin = user_signed_in? && current_user.admin
    correct_user = user_signed_in? && current_user == @user
    has_permission = is_admin || correct_user
    notice = 'You don\'t have the permissions to do that'

    redirect_to root_path, notice: notice unless has_permission
  end

  def require_admin
    is_admin = user_signed_in? && current_user.admin
    notice = 'You don\'t have the permissions to do that'

    redirect_to root_path, notice: notice unless is_admin
  end
end
