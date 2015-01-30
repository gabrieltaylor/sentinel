Rails.application.routes.draw do
  
  # Added by Koudoku.
  mount Koudoku::Engine, at: 'koudoku'
  scope module: 'koudoku' do
    get 'pricing' => 'subscriptions#index', as: 'pricing'
  end


  devise_for :users
  resources :users do
    resources :services do
      post :subscribe
    end
  end
  resources :incidents do
    resources :alerts do
      get :speak, defaults: { format: "xml" }
    end
  end

  root to: 'high_voltage/pages#show', id: 'home'
end
