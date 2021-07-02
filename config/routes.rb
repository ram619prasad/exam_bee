Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions, only: [:index] do
    collection do
      post :import
    end

    member do
      get :answers
    end
  end

  resources :answers, only: [:index] do
    collection do
      post :import
    end
  end

  resources :users, only: [:create, :show]
end
