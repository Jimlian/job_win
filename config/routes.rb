Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  root 'welcome#index'

  resources :jobs do
    resources :resumes

    member do
      post :add
      post :remove
    end
  end

  resources :collections

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end

      resources :resumes
    end
  end

  namespace :account do
    resources :resumes
  end
end
