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
    

  end

  def returning
  end



end