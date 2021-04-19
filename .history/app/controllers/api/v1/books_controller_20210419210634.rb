class Api::V1::BooksController < ActionController::API

  def incomes_checking
    response_message = {}
    book = Book.find_by(id: params[:id])
    incomes = book.incomes
    if incomes.present?
      response_message[:data] = {
        related_incomes: incomes.map do |income|
          {
            book_id: income.book_id,
            amount: income.amount,
            begin_at: income.begin_at,
            end_at: income.begin_at
          }
        end
      }
      response_message[:code] = 200
      response_message[:message] = "ok"
    else
      response_message[:code] = 200
      response_message[:message] = "This book has no income "
    end
    render json: response_message
  end
end
