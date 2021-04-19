class Api::V1::BooksController < ActionController::API

  def incomes_checking
    response_message = {}
    book = Book.find_by(id: params[:id])
    incomes = book.incomes
    response_message[:data] = {
      related_incomes: incomes.map do |income|
        {
          book_id: income.book_id,
          amount: income.amount,
          
          book_id: borrowed_book.id,
          state: borrowed_book.state
        }
      end
    }


  end
  
end
