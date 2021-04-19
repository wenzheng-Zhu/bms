Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          post :initial_amount_setting
          post :b
          post :return
          
        end
        
      end
    end
  end
end
