$initial_amount = 
class Api::V1::UsersController < ActionController::API
  
  before_action :judge_account_balance, only: [:borrowing]

  def index
    
  end

  def create
    user = User.new(users_params)
    if 
  end

  def initial_amount_setting
    
    
  
  end

  def borrowing
    response_message = {}
    if @result
      book = Book.find_by(id: params[:book_id])
      user = User.find_by(id: params[:user_id])
      account = Account.find_by(user_id: user.id)
      if book && book.state == "available"
        loan = Loan.create(account_id: account.id, start_time: Time.now)
        book.update(loan_id: loan.id, state: "unavailable")
        response_message[:code] = 200
        response_message[:message] = "you have successfully borrowed this book"
      else
        response_message[:code] = 200
        response_message[:message] = "soory, the book you are going to borrow is not available"
      end
    else
      response_message[:code] = 200
      response_message[:message] = "sorry, no enough balance for your account, please charge first"
    end
    render json: response_message
  end

  def returning
    response_message = {}
    bank = User.find_by(name: "BANK")
    bank_account = Account.find_by(user_id: bank.id)
    user = User.find_by(id: params[:user_id])
    user_account = Account.find_by(user_id: params[:user_id])
    library_account = Account.find_by
    book = Book.find_by(id: params[:book_id])
    fees = calculate(book.id)
    Account.transaction do 
      bank_account.deposit(fees) 
      user_account.withdraw(fees) 
    end
    loan_id = book.loan_id
    Loan.find_by()
    

    
  end

  private

  def calculate(book_id)
    book = Book.find_by(id: book_id)
    loan_id = book.loan_id
    loan = Loan.find_by(id: loan_id)
    fees_one_book_per_day = ENV["fees_one_book_per_day"].to_f
    seconds = Time.now - start_time
    fees = (seconds / 86400) * fees_one_book_per_day    #按日计算，未超过一天，计费0元
  end

  def judge_account_balance
    user = User.find_by(id: params[:user_id])
    account = Account.find_by(user_id: user.id)
    if account.balance <= 0.00
      @result = false
    else
      @result = true
    end
  end

  




end