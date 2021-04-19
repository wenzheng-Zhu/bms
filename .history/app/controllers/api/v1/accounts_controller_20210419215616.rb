class Api::V1::AccountsController < ActionController::API
  def index
    response_message = {}
    accounts = Account.all
    response_message[:code] = 200
    response_message[:message] = "ok"
    response_message[:data] = accounts.map do |account|
      {
        balance: account.balance,
        user_id: account.user_id,
        id: account.id
      }
    end
    render json: response_message
  end
end