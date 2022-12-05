Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:id/start', to: 'tests#start'

end
