class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @all_accounts = current_user.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      redirect_to account_path(@account)
    else
      flash[:errors] = @account.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to account_path(@account)
    else
      flash[:errors] = @account.errors.full_messages
      render 'edit'
    end
  end

  private

    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :account_classification, :context, :balance)
    end
end
