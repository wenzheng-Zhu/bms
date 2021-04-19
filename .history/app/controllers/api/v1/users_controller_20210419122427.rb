$initial_amount = 
class Api::V1::UsersController < ActionController::API

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
    render json: response_message
  end

  def returning
    book = Book.find_by(id: params[:book_id])
    fees = calculate()

    
  end

  private

  def calculate(book_id)
    book = Book.find_by(id: params[:book_id])
    loan_id = book.loan_id
    loan = Loan.find_by(id: loan_id)
    per
    
  end




end