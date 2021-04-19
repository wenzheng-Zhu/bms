Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        mem do
          post :borrowing
          post :returning
          
        end
        
      end
    end
  end
end
