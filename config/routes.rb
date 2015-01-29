Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :services do
      post :subscribe
    end

    resources :incidents do
      resources :alerts
    end
  end

  root to: 'high_voltage/pages#show', id: 'home'
end
