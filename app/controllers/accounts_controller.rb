class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    render @account.save ? @account : 'new'
  end

  private

  def account_params
    params.require(:account).permit(:name, :type, :context, :balance)
  end
end
