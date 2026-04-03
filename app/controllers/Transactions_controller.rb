class TransactionsController < ApplicationController
  def show
  end

  def new
    @transaction = Transaction.new(posting_date: Date.current)
  end

  def create
    @transaction = Transaction.new(transaction_params.merge(
      account_id: find_account.id,
      user_id: find_user.id,
      transaction_type: "manual"
    ))

    if @transaction.save
      flash[:notice] = "New transaction has been created."
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_user
    User.find(1)
  end

  def find_account
        Account.find(1)
  end

  def transaction_params
        params.require(:transaction).permit(:payment_reference, :amount, :currency, :counterparty, :posting_date)
  end
end
