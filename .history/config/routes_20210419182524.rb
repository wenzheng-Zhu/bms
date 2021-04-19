Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :users do
      
        member do
          post :borrowing
          post :returning
        end
      end

      resources :accounts 
    end
  end
end
