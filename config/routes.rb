# frozen_string_literal: true

Rails.application.routes.draw do
  get 'start/index'
  get 'notice/index'

  # get 'notice/index'

  # get 'sessions/new'

  # root 'notice#index'

  get :start, to: 'start#index'

  root to: 'tests#index'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
