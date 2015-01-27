Rails.application.routes.draw do
  devise_for :users
  resource :users do
    resource :services
  end
  root to: 'high_voltage/pages#show', id: 'home'
end
