class Api::V1::UsersController < ActionController::API
  
  before_action :judge_whether_can_borrow, only: [:borrowing]

  def index
    response_message = {}
    users = User.all
    response_message[:code] = 200
    response_message[:message] = "ok"
    response_message[:data] = users.map do |user|
      {
        name: user.name,
        email: user.email,
        gender: user.gender,
        phone: user.phone,
        quantity: user.quantity
      }
    end
    render json: response_message
  end

  # def create
  #   user = User.new(users_params)
    
  # end

  # def initial_amount_setting
    
    
  
  # end

  def related_account_status
    response_message = {}
    user = User.find_by(id: params[:id])
    account = user.account
    loans = Loan.where(account_id: account.id)
    loan_ids = []
    loans.each do |loan|
      loan_ids << loan.id
    end
    borrowed_books = Book.where(loan_id: loan_ids)
    response_message[:code] = 200
    response_message[:message] = "ok"
    response_message[:data] = {
      current_balance: account.balance,
      current_borrowd_books: borrowed_books.map do |borrowed_book|
        {
          title: borrowed_book.title,
          sn: borrowed_book.sn,
          

        }
    }


  end

  def borrowing
    response_message = {}
    if @result
      book = Book.find_by(id: params[:book_id])
      user = User.find_by(id: params[:id])
      account = Account.find_by(user_id: user.id)
      if book && book.state == "available"
        loan = Loan.create(account_id: account.id, start_time: Time.now)
        book.update(loan_id: loan.id, state: "unavailable")
        quantity = user.quantity - 1
        user.update(quantity: quantity)
        response_message[:code] = 200
        response_message[:message] = "You have successfully borrowed this book"
      else
        response_message[:code] = 500
        response_message[:message] = "Sorry, the book you are going to borrow is not available"
      end
    else
      response_message[:code] = 500
      response_message[:message] = "Sorry, no enough balance for your account or no enough remains of quantities of the book you can borrow, please check and charge first"
    end
    render json: response_message
  end

  def returning
    response_message = {}
    bank = User.find_by(name: "BANK")
    bank_account = Account.find_by(user_id: bank.id)
    user = User.find_by(id: params[:id])
    user_account = Account.find_by(user_id: params[:id])
    book = Book.find_by(id: params[:book_id])
    fees = calculate(book.id)
    Account.transaction do 
      bank_account.deposit(fees) 
      user_account.withdraw(fees) 
    end
    quantity = user.quantity - 1
    user.update(quantity: quantity)
    loan_id = book.loan_id
    Loan.find_by(id: loan_id).update(end_time: Time.now)
    response_message[:code] = 200
    response_message[:message] = "Successfully returned"
    render json: response_message
  end

  private

  def calculate(book_id)
    book = Book.find_by(id: book_id)
    loan_id = book.loan_id
    loan = Loan.find_by(id: loan_id)
    fees_one_book_per_day = ENV["fees_one_book_per_day"].to_f
    seconds = (Time.now - loan.start_time).to_i
    fees = (seconds / 86400) * fees_one_book_per_day    #按日计算，未超过一天，计费0元
    logger.info"-----------------#{fees}--------------------------"
  end

  def judge_whether_can_borrow                     #通过该账户的balance和 剩余能借的书的数量(users#quantity)
    user = User.find_by(id: params[:id])
    account = Account.find_by(user_id: user.id)
    logger.info "--------------#{account.balance}-----------------"
    if account.balance > 0.00 && user.quantity > 0
      @result = true
    else
      @result = false
    end
  end

end