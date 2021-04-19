Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :users do
        member do
          post :related_account_status
          post :borrowing
          post :returning
        end
      end

      resources :books do
        member post
      end

      resources :accounts 
    end
  end
end
