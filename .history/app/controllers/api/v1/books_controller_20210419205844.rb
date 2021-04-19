class Api::V1::BooksController < ActionController::API

  def incomes_checking
    response_message = {}
    book = Book.find_by(id: params[:id])
    incomes = book.incomes
    response_message[:data] = {
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
