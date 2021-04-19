class Api::V1::LoansController < ActionController::API
  def index
    response_message = {}
    loans = Loan.all
    response_message[:code] = 200
    response_message[:message] = "ok"
    response_message[:data] = loans.map do |loan|
      {
        account_id: loan.account_id,
        user_id: account.user_id,
        id: loan.id
      }
    end
    render json: response_message
  end
end