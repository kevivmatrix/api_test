Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    defaults format: :json do
      resources :customers, only: [ :index, :create, :destroy ]
    end
  end
end
