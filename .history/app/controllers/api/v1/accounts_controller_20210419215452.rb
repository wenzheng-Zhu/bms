class Api::V1::BooksController < ActionController::API
  def index
    response_message = {}
    books = Book.all
    response_message[:code] = 200
    response_message[:message] = "ok"
    response_message[:data] = books.map do |book|
      {
        title: book.title,
        sn: book.sn,
        state: book.state,
        id: book.id,
        loan_id: book.loan_id
      }
    end
    render json: response_message
  end
end