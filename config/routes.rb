Rails.application.routes.draw do

  get 'users/new'

  root 'tests#index'

  get :signup, to: 'users#new'

  resource :users, only: :create

  resources :answers
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :star
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
