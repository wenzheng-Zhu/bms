class Api::V1::LoansController < ActionController::API
  def index
    response_message = {}
    loans = Loan.all
    response_message[:code] = 200
    response_message[:message] = "ok"
    response_message[:data] = loans.map do |loan|
      {
        balance: account.balance,
        user_id: account.user_id,
        id: account.id
      }
    end
    render json: response_message
  end
end