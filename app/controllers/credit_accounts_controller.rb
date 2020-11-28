# frozen_string_literal: true

# CreditAccount Controller
class CreditAccountsController < ApplicationController
  before_action :set_user
  before_action :require_permission
  before_action :require_ownership_permission, only: %i[show]

  # GET /users/:user_id/credit_accounts/new
  def new
    @account = CreditAccount.new
  end

  # POST /users/:user_id/debit_accounts
  def create
    @account = CreditAccount.new(account_params)
    @account.user = @user
    if @account.save
      redirect_to @user, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def show
    @transactions = @account.transactions
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:credit_account).permit(:currency, :liquid_balance,
                                           :credit_limit)
  end

  def require_permission
    is_admin = user_signed_in? && current_user.admin
    correct_user = user_signed_in? && current_user == @user
    has_permission = is_admin || correct_user
    notice = 'You don\'t have the permissions to do that'

    redirect_to root_path, notice: notice unless has_permission
  end

  def require_ownership_permission
    @account = CreditAccount.find(params[:id])
    is_admin = user_signed_in? && current_user.admin
    is_account_owner_user = @account.user == @user
    has_permission = is_admin || is_account_owner_user
    notice = 'You don\'t have the permissions to do that'

    redirect_to root_path, notice: notice unless has_permission
  end
end
