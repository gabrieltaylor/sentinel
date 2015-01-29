Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :services do
      post :subscribe
    end

    resources :incidents do
      resources :alerts do
        get :speak
      end
    end
  end

  root to: 'high_voltage/pages#show', id: 'home'
end
