Rails.application.routes.draw do

  root 'tests#index'

  get    :signup, to: 'users#new'
  get    :login,  to: 'sessions#new'
  post   :login,  to: 'sessions#create'
  delete :logout, to: 'sessions#delete'

  resource :users,    only: :create
  resource :sessions, only: :create

  resources :answers
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start, on: :member
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
