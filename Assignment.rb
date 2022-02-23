
# Post Transaction
Transfer.transaction 
do
  sender.debit_account(amount) 
if
  sender.sufficient_balance(amount)
  credit_amount = convert_currency(Id, recipient, amount, Date)
  perform_transfer(recipient, credit_amount, sender)
end


# Get Transaction
Transfer.transaction do
...
end

# get Transaction By Id	
class TransactionsController < ApplicationController

  def new
   @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])      #this is row 21
  end
    private
      def transaction_params
        params.require(:transaction).permit(:company, :month, :account_code, :description, :transaction_amount)
      end
end
