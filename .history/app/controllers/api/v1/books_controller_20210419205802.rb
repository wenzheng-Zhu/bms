class Api::V1::BooksController < ActionController::API

  def incomes_checking
    response_message = {}
    book = Book.find_by(id: params[:id])
    response_message[:data] = {
      current_balance: account.balance,
      current_borrowd_books: borrowed_books.map do |borrowed_book|
        {
          title: borrowed_book.title,
          sn: borrowed_book.sn,
          book_id: borrowed_book.id,
          state: borrowed_book.state
        }
      end
    }


  end
  
end
