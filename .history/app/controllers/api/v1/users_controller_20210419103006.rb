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
    book = Book.find_by(id: params[:book_id])
    user = User.find_by(id: params[:user_id])
    account = Account.find_by(user_id: user.id)
    if book && book.state == "available"
      Loan.create(account_id: account.id, start_time: Time.now)
    end
    

  end

  def returning
  end



end