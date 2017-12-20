Rails.application.routes.draw do
  get 'profiles/show'

  root 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments
  end

  get ':user_name', to: 'profiles#show', as: :profile

end
