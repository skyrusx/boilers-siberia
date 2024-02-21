Rails.application.routes.draw do
  root "pages#landing"

  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get '/login', to: 'devise/sessions#new', as: :new_user_session
    post '/login', to: 'devise/sessions#create', as: :user_session
    delete '/logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :admin, only: :index
  scope :admin do
    resources :advantages, except: :show
    resources :social_links, except: :show
    resources :contacts, except: :show
    resources :activities, except: :show
    resources :reviews, except: :show
    resources :bonuses, except: :show
    resources :supports, except: :show, path: :support
    scope :support do
      resources :groups, except: :show
    end

    resources :products, except: :show
  end
end
